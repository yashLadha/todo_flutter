import 'package:flutter/cupertino.dart';
import 'package:todo_flutter/models/TaskModel.dart';

class TodoModel extends ChangeNotifier {
  List<TaskModel> taskList = [];

  addTaskInList() {
    TaskModel taskModel =
        TaskModel("sample title ${taskList.length}", "sample details");
    taskList.add(taskModel);

    notifyListeners();
  }
}
