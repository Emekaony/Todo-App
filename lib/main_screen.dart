import "package:flutter/material.dart";

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // so inside the screens we ise Scaffold
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Todo App"),
      ),
    );
  }
}
