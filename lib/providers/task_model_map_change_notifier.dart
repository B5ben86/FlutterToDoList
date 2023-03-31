import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/mock/task_model_mock_database.dart';
import 'package:uptodo/models/task_model/task_model.dart';

class TaskModelMapChangeNotifier with ChangeNotifier, DiagnosticableTreeMixin {
  Map<String, TaskModel> taskModelMap = Map.of({});

  List<TaskModel> get taskModelList {
    return taskModelMap.values.toList();
  }

  List<TaskModel> get todoTaskModeList {
    List<TaskModel> newList = List.of([]);
    taskModelMap.forEach((key, value) {
      if (value.finished != true) {
        newList.add(value);
      }
    });
    return newList;
  }

  List<TaskModel> get completedTaskModelList {
    List<TaskModel> newList = List.of([]);
    taskModelMap.forEach((key, value) {
      if (value.finished == true) {
        newList.add(value);
      }
    });
    return newList;
  }

  DateTimeRange get taskModelDateTimeRange {
    DateTime startDate = DateTime.now();
    DateTime endDate = DateTime(2017, 1, 1, 0, 0);

    taskModelMap.forEach((key, value) {
      if (value.dateTime.isBefore(startDate)) {
        startDate = value.dateTime;
      }
      if (value.dateTime.isAfter(endDate)) {
        endDate = value.dateTime;
      }
    });

    DateTimeRange dateTimeRange = DateTimeRange(start: startDate, end: endDate);
    return dateTimeRange;
  }

  List<TaskModel> taskModelListInOneDay(DateTime dateTime, bool isFinished) {
    List<TaskModel> newList = List.of([]);
    taskModelMap.forEach((key, value) {
      if (value.finished == isFinished) {
        if (value.dateTime.year == dateTime.year &&
            value.dateTime.month == dateTime.month &&
            value.dateTime.day == dateTime.day) {
          newList.add(value);
        }
      }
    });
    return newList;
  }

  get length {
    return taskModelMap.length;
  }

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
