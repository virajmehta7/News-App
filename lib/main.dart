import 'package:flutter/material.dart';
import 'views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme:
            TextTheme(titleLarge: TextStyle(color: Colors.black, fontSize: 22)),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
        ),
        backgroundColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade100,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme:
            TextTheme(titleLarge: TextStyle(color: Colors.white, fontSize: 22)),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.white,
        ),
        backgroundColor: Colors.grey.shade700,
        highlightColor: Colors.grey.shade600,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      themeMode: ThemeMode.system,
    );
  }
}
