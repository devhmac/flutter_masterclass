import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  TextEditingController myController = TextEditingController();

  String greetingMessage = '';
  void greetUser() {
    String username = myController.text;
    setState(() {
      greetingMessage = 'Hello ' + username;
    });
    print(myController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(greetingMessage),
              // Container(
              TextField(
                controller: myController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Type Your name'),
                // ),
                // padding: EdgeInsets.all(20),
              ),
              ElevatedButton(onPressed: greetUser, child: Text('Tap'))
            ],
          ),
        ),
      ),
    );
  }
}
