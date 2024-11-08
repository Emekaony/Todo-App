import "package:flutter/material.dart";
import "package:flutter_app_one/main_screen.dart";

void main() {
  runApp(const TodoApp());
}

// this is the general workflow when creating a stateful app in Flutter
class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      home: const MainScreen(),
    );
  }
}
