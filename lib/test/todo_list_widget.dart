import 'package:flutter/material.dart';

/// Date: 2019-09-29 14:44
/// Author: Liusilong
/// Description:
//

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  static const _appTitle = 'Todo List';
  final todos = <String>[];
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_appTitle),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: controller,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final todo = todos[index];
                    return Dismissible(
                      key: Key('$todo$index'),
                      onDismissed: (direction) => todos.removeAt(index),
                      child: ListTile(title: Text(todo)),
                      background: Container(color: Colors.red),
                    );
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (controller.text.isNotEmpty) {
                todos.add(controller.text);
                controller.clear();
              }
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
