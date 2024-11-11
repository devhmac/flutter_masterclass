import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_list/pages/home_page.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  // var appDocDir = await getApplicationDocumentsDirectory();
  // var path = 'assets/db';
  // if (!kIsWeb) {
  //   path = appDocDir.path;
  // }
  WidgetsFlutterBinding.ensureInitialized();
// init hive local db

  await Hive.initFlutter();
  // Hive.init(path);
// open hive 'box'
  await Hive.openBox('TodosBox');

// to reference Hive.open('TodosBox')
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos app',
      home: const HomePage(),
      theme: ThemeData(
          primarySwatch: Colors.grey,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blueGrey,
          )),
    );
  }
}
