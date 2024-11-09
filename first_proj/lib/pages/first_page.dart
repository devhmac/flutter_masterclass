import 'package:first_proj/pages/page_two.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  void userTapped() {
    print('Tapped!');
  }

  @override
  Widget build(BuildContext context) {
    List names = ['Devin', "ben", 'Aaron'];

    void navigatorFunc() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PageTwo()),
      );
    }

    return Scaffold(
      appBar: AppBar(
          title: Text('App bar'),
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              // onPressed: navigatorFunc,
              onPressed: () {
                Navigator.pushNamed(context, '/secondpage');
              },
            )
          ]),
      drawer: Drawer(),
      body: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Center(
          child: ListView(
            children: [
              GestureDetector(
                onTap: userTapped,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent,
                  ),
                  padding: const EdgeInsets.all(25),
                  // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('navigate'),
                ),
                height: 200,
                width: 200,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
