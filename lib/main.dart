import 'package:flutter/material.dart';
import 'package:todo_app/pages/getstarted.dart';

void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color(0xFF655EE9),
          accentColor: const Color(0xFFA975E4),
          splashColor: Colors.grey,
          highlightColor: Colors.grey),
      home: GetStarted(),
    ),
  );
}
