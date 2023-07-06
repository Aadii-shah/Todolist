import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskie/data/database.dart';
import 'package:taskie/utils/ToDoList.dart';
import 'package:taskie/utils/dialogBox.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // text controller
  final _controller = TextEditingController();

  // reference the hive box
  final _myBox = Hive.box('myBox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // if 1st time, create default data
    if (_myBox.get('TODOLIST') == null) {
      db.createInitData();
    } else {
      // else there already exist data
      db.loadData();

    }
    super.initState();
  }


  // list of todo task
  // List toDolist = [
  //   ['Go to Gym', false],
  //   ['Read books', false],
  // ];

  // save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([ _controller.text, false]);
      _controller.clear();
    });

    db.updateDataBase();

    Navigator.of(context).pop();
  }

  // checked box was tapped 
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // creating new task 
  void createNewTask() {
    showDialog(
    context: context, 
    builder: (context) {
      return DialogBox(
        controller: _controller,
        onsave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
        );

    },
    );
  }

  // deleting the task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('TO DO'),
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
          taskName: db.toDoList[index][0], 
          taskCompleted: db.toDoList[index][1], 
          onChanged: (value) => checkBoxChanged(value, index),
          deleteFunction: (context) => deleteTask(index),
          );
        },
        
      ),
    );
  }
}