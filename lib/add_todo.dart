import "package:flutter/material.dart";

class AddTodo extends StatefulWidget {
  AddTodo({required this.addTodo, super.key});
  // callback that signifies that something has changed!
  final ValueChanged<String> addTodo;

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController _todoText = TextEditingController();
  String _hintText = "enter a task...";

  void onAddPressed(String todo) {
    if (todo.trim().isEmpty) {
      setState(() {
        _hintText = "you must enter an item...";
        _todoText.selection = TextSelection.collapsed(offset: 0);
      });
    } else {
      widget.addTodo(todo);
      _todoText.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Add Todo"),
        TextField(
          controller: _todoText, // sync this to the controller
          decoration: InputDecoration(hintText: _hintText),
          autocorrect: false,
        ),
        ElevatedButton(
          onPressed: () {
            onAddPressed(_todoText.text);
          },
          child: Text("Add"),
        )
      ],
    );
  }
}
