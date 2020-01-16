import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/TodoModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        builder: (content) => TodoModel(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        title: Text("Todo Flutter"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(59),
                  topRight: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              child: Consumer<TodoModel>(
                builder: (context, todo, child) {
                  return ListView.builder(
                    itemCount: todo.taskList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: ListTile(
                          contentPadding: EdgeInsets.only(
                            left: 32,
                            top: 8,
                            right: 32,
                            bottom: 8,
                          ),
                          title: Text(
                            todo.taskList[index].getTitle,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            todo.taskList[index].getDetail,
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          ),
                        ),
                        margin: EdgeInsets.only(
                          bottom: 8,
                          left: 16,
                          right: 16,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Provider.of<TodoModel>(context).addTaskInList();
        },
      ),
    );
  }
}
