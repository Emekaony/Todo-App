import "package:flutter/material.dart";
import "package:feather_icons/feather_icons.dart";

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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              FeatherIcons.camera,
              color: Colors.red,
            ),
          )
        ],
        centerTitle: true,
        title: const Text("Todo App"),
      ),
    );
  }
}
