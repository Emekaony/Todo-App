import "package:feather_icons/feather_icons.dart";
import "package:flutter/material.dart";

class TodoListBuilder extends StatefulWidget {
  List<String> todoList;
  void Function() updateLocalData;

  TodoListBuilder(
      {super.key, required this.todoList, required this.updateLocalData});

  @override
  State<TodoListBuilder> createState() => _TodoListBuilderState();
}

class _TodoListBuilderState extends State<TodoListBuilder> {
  // this function gets triggered when an item is clicked!
  void onItemClicked({required int index}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.todoList.removeAt(index);
                });
                // also update sharedPreferences when data is removed from the list
                widget.updateLocalData();
                Navigator.pop(context);
              },
              child: Text("Mark as Done")),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todoList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            onItemClicked(index: index);
          },
          leading: Icon(FeatherIcons.briefcase),
          trailing: Icon(FeatherIcons.activity),
          title: Text(widget.todoList[index]),
        );
      },
    );
  }
}
