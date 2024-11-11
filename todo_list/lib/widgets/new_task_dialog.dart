import 'package:flutter/material.dart';
import 'package:todo_list/widgets/button.dart';

class NewTaskDialog extends StatelessWidget {
  const NewTaskDialog(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  // controller.text = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a Task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BaseButton(
                  title: 'Submit',
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 8,
                ),
                BaseButton(
                  title: 'Cancel',
                  onPressed: onCancel,
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
