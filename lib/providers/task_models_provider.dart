import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:uptodo/mock/task_model_mock_database.dart';
import 'package:uptodo/models/task_model/task_model.dart';

class TaskModelMapChangeNotifier with ChangeNotifier, DiagnosticableTreeMixin {
  Map<String, TaskModel> taskModelMap = Map.of({});

  void insertTaskModel(TaskModel taskModel) {
    taskModelMap[taskModel.id] = taskModel;
    notifyListeners();
    _saveToDatabase();
  }

  void deleteTaskModel(String id) {
    taskModelMap.remove(id);
    notifyListeners();
    _saveToDatabase();
  }

  void updateTaskModel(TaskModel taskModel) {
    if (taskModelMap[taskModel.id] != null) {
      taskModelMap[taskModel.id]?.copyFrom(taskModel);
      notifyListeners();
      _saveToDatabase();
    }
  }

  void updateTaskModelFinished(String id, bool finished) {
    if (taskModelMap[id]?.finished != finished) {
      taskModelMap[id]?.finished = finished;
      notifyListeners();
      _saveToDatabase();
    }
  }

  void clear() {
    taskModelMap.clear();
    notifyListeners();
    _saveToDatabase();
  }

  Future<void> loadFromDatabase() async {
    taskModelMap.clear();
    var mapRead = await TaskModelMockDatabase.loadTaskModelMapFromDatabase();
    if (mapRead != null) {
      //map 读取成功，转换成 taskModelMap
      for (var element in mapRead.values) {
        var taskModel = TaskModel.fromJson(element);
        taskModelMap[taskModel.id] = taskModel;
      }

      debugPrint('Task Model Map 读取成功 : ${jsonEncode(taskModelMap)}');
    }
  }

  Future<void> _saveToDatabase() async {
    await TaskModelMockDatabase.storeTaskModelMapToDatabase(taskModelMap);
  }
}
