import "package:flutter/material.dart";
import "package:feather_icons/feather_icons.dart";
import "package:flutter_app_one/add_todo.dart";
import "package:flutter_app_one/widgets/todolist.dart";
import "package:shared_preferences/shared_preferences.dart";

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> todoList = [];

  void handleTodoChanged(String todo) {
    // no duplicates allowed
    if (todoList.contains(todo)) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("This item already exists in the list."),
              content: Text("This item already exists"),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close"),
                ),
              ],
            );
          });

      return;
    }
    setState(() {
      todoList.insert(0, todo);
    });
    updateLocalData();
    // this pops the most recent screen, pretty cool
    Navigator.pop(context);
  }

  void updateLocalData() async {
// Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
// Save an list of strings to 'items' key.
    await prefs.setStringList('todoList', todoList);
  }

  void loadLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    todoList = (prefs.getStringList("todoList") ?? []).toList();
  }

  @override
  void initState() {
    loadLocalData();
    super.initState();
  }

  // this function gets triggered when the add button gets pressed.
  void onAddButtonPressed() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height: 200,
            padding: EdgeInsets.all(10.0),
            child: AddTodo(
              addTodo: handleTodoChanged,
            ),
          ),
        );
      },
    );
  }

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
            borderRadius: BorderRadius.circular(10),
            onTap: onAddButtonPressed,
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                FeatherIcons.plus,
                color: Colors.black,
              ),
            ),
          )
        ],
        centerTitle: true,
        title: const Text("Todo App"),
      ),
      body:
          TodoListBuilder(todoList: todoList, updateLocalData: updateLocalData),
    );
  }
}
