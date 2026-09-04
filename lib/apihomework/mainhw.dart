import 'package:flutter/material.dart';
import 'screens/todohs.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const TodoHomeScreen(),
    );
  }
}