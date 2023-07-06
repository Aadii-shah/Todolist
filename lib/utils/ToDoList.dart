// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;

  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  
  ToDoList({super.key, 
  required this.taskName, 
  required this.taskCompleted,
  required this.onChanged,
  required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(

         motion: StretchMotion(), 
         children: [
          SlidableAction(onPressed: deleteFunction,
          icon: Icons.delete,
          backgroundColor: Colors.black,
          borderRadius: BorderRadius.circular(12),
          )
         ]),

        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // check box
              Checkbox(
              value: taskCompleted, 
              onChanged: onChanged,
              activeColor: Colors.black,
              ),
      
              // task name
              Expanded(
                child: Text(taskName,
                style: TextStyle(decoration: taskCompleted 
                ? TextDecoration.lineThrough
                : TextDecoration.none),
                ),
              ),
            ],
          ),
          
        ),
      ),
    );
  }

 
}