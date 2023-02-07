import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uptodo/mock/category_model_mock_database.dart';
import 'package:uptodo/models/category_model/category_model.dart';

class CategoryModelsHandler {
  static final CategoryModelsHandler _instant = CategoryModelsHandler._();

  CategoryModelsHandler._();

  factory CategoryModelsHandler() => _instant;

  final Map<String, CategoryModel> _modelMap = {};

  void insertModel(CategoryModel model) {
    _modelMap[model.id] = model;
    _saveToDatabase();
  }

  void deleteModel(String id) {
    _modelMap.remove(id);
    _saveToDatabase();
  }

  List<CategoryModel> getModelList() {
    return _modelMap.values.toList();
  }

  CategoryModel? getModel(String id) {
    return _modelMap[id];
  }

  int amount() {
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
      //map 读取成功，转换成 CategoryModelMap
      for (var element in mapRead.values) {
        var model = CategoryModel.fromJson(element);
        _modelMap[model.id] = model;
      }

      debugPrint('Category Model Map 读取成功 : ${jsonEncode(_modelMap)}');
    } else {
      //若无数据，则创建 default 数据
      var defaultModelList = [
        CategoryModel('Grocery', 0, 0),
        CategoryModel('Work', 1, 1),
        CategoryModel('Sport', 2, 2),
        CategoryModel('Design', 3, 3),
      ];

      for (var model in defaultModelList) {
        insertModel(model);
      }

      debugPrint('Category Model Map 读取为空，创建默认数据 : ${jsonEncode(_modelMap)}');
    }
  }

  Future<void> _saveToDatabase() async {
    await CategoryModelMockDatabase.storeCategoryModelMapToDatabase(_modelMap);
  }
}
