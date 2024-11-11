import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_list/data/database.dart';
import 'package:todo_list/widgets/new_task_dialog.dart';
import 'package:todo_list/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _todosBox = Hive.box('TodosBox');
  TodoDatabase db = TodoDatabase();
  // List of todos

  @override
  void initState() {
// If first time ever opened, load initi date
// Were checking here if the TODOLIST key has ever been initialized, if not then its new
    if (_todosBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      // data already exists
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

  final _newTaskController = TextEditingController();

  void checkboxOnChange(bool? val, int taskIndex) {
    setState(() {
      db.todoList[taskIndex][1] = !db.todoList[taskIndex][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    String task = _newTaskController.text;
    setState(() {
      db.todoList.add([task, false]);
    });
    _newTaskController.text = '';
    Navigator.pop(context);
    db.updateData();
  }

  void cancelNewTask() {
    _newTaskController.text = '';
    Navigator.pop(context);
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  void createNewTodo() {
    showDialog(
        context: context,
        builder: (context) {
          return NewTaskDialog(
            controller: _newTaskController,
            onSave: saveNewTask,
            onCancel: cancelNewTask,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'To Do',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 4,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: createNewTodo,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          var task = db.todoList[index];
          return TodoTile(
            task: task[0],
            complete: task[1],
            onChange: (val) => checkboxOnChange(val, index),
            onDelete: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
