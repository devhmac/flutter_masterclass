import 'package:first_proj/pages/first_page.dart';
import 'package:first_proj/pages/page_two.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List names = ['Devin', "ben", 'Aaron'];
    return MaterialApp(
      home: FirstPage(),
      routes: {
        '/home': (context) => FirstPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
        // Gridview builder example
        // GridView.builder(
        //   itemCount: 60,
        //   gridDelegate:
        //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
        //   itemBuilder: (context, index) => GridTile(
        //       child: Container(
        //     margin: EdgeInsets.all(5),
        //     color: Colors.purple.shade200,
        //     child: Text('hello'),
        //   )),
        // )

        //  listview example
        // ListView.builder(
        //   itemCount: names.length,
        //   itemBuilder: (context, index) => ListTile(
        //     title: Text(
        //       names[index],
        //     ),
        //   ),
        // )

        // a classic list view example below
        // body: Center(
        //   child: ListView(
        //     children: [
        //       Container(
        //         height: 300,
        //         width: 300,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(20),
        //           color: Colors.blueAccent,
        //         ),
        //         padding: const EdgeInsets.all(25),
        //         // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        //         child: Icon(
        //           Icons.favorite,
        //           color: Colors.white,
        //           size: 50,
        //         ),
        //       ),
        //       Container(
        //         height: 200,
        //         width: 200,
        //         color: Colors.white,
        //       )
        //     ],
        //   ),
        // ),
