import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uptodo/mock/task_model_mock_database.dart';
import 'package:uptodo/models/task_model/task_model.dart';

class TaskModelsHandler {
  static final TaskModelsHandler _instant = TaskModelsHandler._();

  TaskModelsHandler._();

  factory TaskModelsHandler() => _instant;

  final Map<String, TaskModel> _taskModelMap = {};

  void insertTaskModel(TaskModel taskModel) {
    _taskModelMap[taskModel.id] = taskModel;
    _saveToDatabase();
  }

  void deleteTaskModel(String id) {
    _taskModelMap.remove(id);
    _saveToDatabase();
  }

  List<TaskModel> getTaskModelList() {
    return _taskModelMap.values.toList();
  }

  TaskModel? getTaskModel(String id) {
    return _taskModelMap[id];
  }

  int tasksAmount() {
    return _taskModelMap.length;
  }

  bool isEmpty() {
    return _taskModelMap.isEmpty;
  }

  Future<void> loadFromDatabase() async {
    _taskModelMap.clear();
    var mapRead = await TaskModelMockDatabase.loadTaskModelMapFromDatabase();
    if (mapRead != null) {
      //map 读取成功，转换成 taskModelMap
      for (var element in mapRead.values) {
        var taskModel = TaskModel.fromJson(element);
        _taskModelMap[taskModel.id] = taskModel;
      }

      debugPrint('Task Model Map 读取成功 : ${jsonEncode(_taskModelMap)}');
    }
  }

  Future<void> _saveToDatabase() async {
    await TaskModelMockDatabase.storeTaskModelMapToDatabase(_taskModelMap);
  }
}
