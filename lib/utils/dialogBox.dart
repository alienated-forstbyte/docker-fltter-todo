import 'package:flutter/material.dart';
import 'package:todo_application/utils/buttons.dart';

class DialogBox extends StatelessWidget{
  var controller;

  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
  required this.controller,
  required this.onSave,
  required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Buttons(text: "Cancel", onPressed: onCancel),

                const SizedBox(width: 8,),

                Buttons(text: "Save", onPressed: onSave),
              ],
            )
          ],
        ),
      ),
    );
  }
}