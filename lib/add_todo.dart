import "package:flutter/material.dart";

class AddTodo extends StatefulWidget {
  AddTodo({required this.onTextChanged, super.key});
  // callback that signifies that something has changed!
  final ValueChanged<String> onTextChanged;

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController todoText = TextEditingController();
  // String textToChange = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Add Todo"),
        TextField(
          controller: todoText, // sync this to the controller
          decoration: InputDecoration(hintText: "enter a task..."),
        ),
        ElevatedButton(
          // just call this function when the add button is pressed!
          onPressed: () => widget.onTextChanged(todoText.text),
          child: Text("Add"),
        )
      ],
    );
  }
}
