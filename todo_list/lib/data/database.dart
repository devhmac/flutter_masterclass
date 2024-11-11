import 'package:hive/hive.dart';

class TodoDatabase {
  List todoList = [];
// ref our box
  final _todosBox = Hive.box('TodosBox');
// run on first ever app open
  void createInitialData() {
    todoList = [
      ['Create your first task!', false]
    ];
  }

  void loadData() {
    // TODOLIST functions like key value store
    todoList = _todosBox.get('TODOLIST');
  }

  void updateData() {
    // this is basically creating the TODOLIST key
    _todosBox.put("TODOLIST", todoList);
  }
}
