import 'package:hive/hive.dart';

class TodoDatabase {

  List toDoList = [];

  // refenrence the box

  final _myBox = Hive.box('myBox');
   // run this method if 1st time opening the app

   void createInitData(){
    toDoList = [
      ['Add your task', false],
      ['Delete task by swiping left', false]

    ];
   }

   // load the data from the Database

   void loadData(){
    toDoList = _myBox.get('TODOLIST');

   }

   // update the database

   void updateDataBase(){
    _myBox.put('TODOLIST', toDoList);

   }

}