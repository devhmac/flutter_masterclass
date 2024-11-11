import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_list/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of todos
  List<List> todoList = [
    ['Task 1', false],
    ['Task 2', false]
  ];

  void checkboxOnChange(bool? val, int taskIndex) {
    setState(() {
      todoList[taskIndex][1] = !todoList[taskIndex][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'To Do',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 4,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          var task = todoList[index];
          return TodoTile(
              task: task[0],
              complete: task[1],
              onChange: (val) => checkboxOnChange(val, index));
        },
      ),
    );
  }
}
