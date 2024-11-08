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
        drawer: Drawer(
          child: Text("Drawer Data"),
        ),
        appBar: AppBar(
          actions: [
            InkWell(
              // I like the idea of giving the Inkwell  a border Radius, makes
              // the feedback UI look more presentable.
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 300,
                      );
                    });
              },
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  FeatherIcons.plus,
                  color: Colors.red,
                ),
              ),
            )
          ],
          centerTitle: true,
          title: const Text("Todo App"),
        ),
        body: GestureDetector(
          onTap: () {
            print("Text detected");
          },
          child: Text("This can be interactive too"),
        ));
  }
}
