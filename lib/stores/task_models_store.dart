import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uptodo/mock/task_model_mock_database.dart';
import 'package:uptodo/models/task_model/task_model.dart';

part 'task_models_store.g.dart';

class TaskModelsStore = _TaskModelsStore with _$TaskModelsStore;

abstract class _TaskModelsStore with Store {
  @observable
  Map<String, TaskModel> _taskModelMap = {};

  @action
  void insertTaskModel(TaskModel taskModel) {
    _taskModelMap[taskModel.id] = taskModel;
    _saveToDatabase();
  }

  @action
  void deleteTaskModel(String id) {
    _taskModelMap.remove(id);
    _saveToDatabase();
  }

  @action
  void clear() {
    _taskModelMap.clear();
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
