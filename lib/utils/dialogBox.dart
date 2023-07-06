import 'package:flutter/material.dart';
import 'package:taskie/utils/myButton.dart';

class DialogBox extends StatelessWidget {
  // controller 
  final controller;
  VoidCallback onsave;
  VoidCallback onCancel;

  DialogBox({super.key, 
  required this.controller,
  required this.onsave,
  required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

          //get user input
          TextField(
          controller: controller ,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Add a new task',

            ),
          ),

          // buttons -> save + cancel 
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            // save button
            MyButton(text: 'save', onPressed: onsave),

            const SizedBox(width: 8,),

            // cancel button
            MyButton(text: 'cancel', onPressed: onCancel),

          ],)
        ],),

      ),

    );
  }
}