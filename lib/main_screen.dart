import "package:flutter/material.dart";
import "package:feather_icons/feather_icons.dart";
import "package:flutter_app_one/add_todo.dart";
import "package:shared_preferences/shared_preferences.dart";

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> todoList = [];

  void handleTodoChanged(String todo) {
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
    todoList = prefs.getStringList("todoList") ?? [];
  }

  @override
  void initState() {
    loadLocalData();
    super.initState();
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
            // I like the idea of giving the Inkwell  a border Radius, makes
            // the feedback UI look more presentable.
            borderRadius: BorderRadius.circular(10),
            onTap: () {
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
            },
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
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int idx) {
          return ListTile(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              todoList.removeAt(idx);
                            });
                            // also update sharedPreferences when data is removed from the list
                            updateLocalData();
                            Navigator.pop(context);
                          },
                          child: Text("Mark as Done")),
                    );
                  });
            },
            leading: Icon(FeatherIcons.briefcase),
            trailing: Icon(FeatherIcons.activity),
            title: Text(todoList[idx]),
          );
        },
      ),
    );
  }
}
