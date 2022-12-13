import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uptodo/mock/category_model_mock_database.dart';
import 'package:uptodo/models/task_model/category_model.dart';

class CategoryModelsHandler {
  static final CategoryModelsHandler _instant = CategoryModelsHandler._();

  CategoryModelsHandler._();

  factory CategoryModelsHandler() => _instant;

  final Map<String, CategoryModel> _modelMap = {};

  void insertModel(CategoryModel model) {
    _modelMap[model.id] = model;
    _saveToDatabase();
  }

  void deleteTaskModel(String id) {
    _modelMap.remove(id);
    _saveToDatabase();
  }

  List<CategoryModel> getTaskModelList() {
    return _modelMap.values.toList();
  }

  CategoryModel? getTaskModel(String id) {
    return _modelMap[id];
  }

  int tasksAmount() {
    return _modelMap.length;
  }

  bool isEmpty() {
    return _modelMap.isEmpty;
  }

  Future<void> loadFromDatabase() async {
    _modelMap.clear();
    var mapRead =
        await CategoryModelMockDatabase.loadCategoryModelMapFromDatabase();
    if (mapRead != null) {
      //map 读取成功，转换成 taskModelMap
      for (var element in mapRead.values) {
        var model = CategoryModel.fromJson(element);
        _modelMap[model.id] = model;
      }

      debugPrint('Category Model Map 读取成功 : ${jsonEncode(_modelMap)}');
    }
  }

  Future<void> _saveToDatabase() async {
    await CategoryModelMockDatabase.storeCategoryModelMapToDatabase(_modelMap);
  }
}
