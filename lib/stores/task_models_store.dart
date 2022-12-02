import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uptodo/mock/task_model_mock_database.dart';
import 'package:uptodo/models/task_model/task_model.dart';

part 'task_models_store.g.dart';

class TaskModelsStore = _TaskModelsStore with _$TaskModelsStore;

abstract class _TaskModelsStore with Store {
  @observable
  ObservableMap<String, TaskModel> taskModelMap = ObservableMap.of({});

  @action
  void insertTaskModel(TaskModel taskModel) {
    taskModelMap[taskModel.id] = taskModel;
    _saveToDatabase();
  }

  @action
  void deleteTaskModel(String id) {
    taskModelMap.remove(id);
    _saveToDatabase();
  }

  @action
  void updateTaskModel(TaskModel taskModel) {
    if (taskModelMap[taskModel.id] != null) {
      taskModelMap[taskModel.id]?.copyFrom(taskModel);
      _saveToDatabase();
    }
  }

  @action
  void updateTaskModelFinished(String id, bool finished) {
    if (taskModelMap[id]?.finished != finished) {
      taskModelMap[id]?.finished = finished;
      _saveToDatabase();
    }
  }

  @action
  void clear() {
    taskModelMap.clear();
  }

  @computed
  bool get isEmpty => taskModelMap.isEmpty;

  @computed
  List<TaskModel> get getTaskModelList => taskModelMap.values.toList();

  TaskModel? getTaskModel(String id) => taskModelMap[id];

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
