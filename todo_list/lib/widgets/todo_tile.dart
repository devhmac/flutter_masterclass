import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      required this.task,
      required this.complete,
      required this.onChange});
  final String task;
  final bool complete;
  final Function(bool?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Card(
        elevation: 3,
        color: Colors.grey.shade300,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              //task name
              Checkbox(value: complete, onChanged: onChange),
              Text(
                task,
                style: complete
                    ? TextStyle(decoration: TextDecoration.lineThrough)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
