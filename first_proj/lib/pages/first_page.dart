import 'package:first_proj/pages/home_page.dart';
import 'package:first_proj/pages/page_two.dart';
import 'package:first_proj/pages/profile_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  void userTapped() {
    print('Tapped!');
  }

// pages
  final List _pages = [
    HomePage(),
    ProfilePage(),
    SettingsPage(),
  ];

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List names = ['Devin', "ben", 'Aaron'];

    void navigatorFunc() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsPage()),
      );
    }

    void _navigationBottomBar(int index) {
      setState(() {
        (_currentPageIndex = index);
      });
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
                Navigator.pushNamed(context, '/settings');
              },
            )
          ]),
      drawer: Drawer(
        backgroundColor: Colors.lightBlue,
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.favorite,
                size: 48,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentPageIndex],
      //  Scaffold(
      //   backgroundColor: Colors.deepPurpleAccent,
      //   body: Center(
      //     child: ListView(
      //       children: [
      //         GestureDetector(
      //           onTap: userTapped,
      //           child: Container(
      //             height: 300,
      //             width: 300,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               color: Colors.blueAccent,
      //             ),
      //             padding: const EdgeInsets.all(25),
      //             // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      //             child: Icon(
      //               Icons.favorite,
      //               color: Colors.white,
      //               size: 50,
      //             ),
      //           ),
      //         ),
      //         Container(
      //           child: ElevatedButton(
      //             onPressed: () {},
      //             child: Text('navigate'),
      //           ),
      //           height: 200,
      //           width: 200,
      //           color: Colors.white,
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          onTap: _navigationBottomBar,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ]),
    );
  }
}
