import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uptodo/mock/category_model_mock_database.dart';
import 'package:uptodo/models/category_model/category_model.dart';

part 'category_models_store.g.dart';

class CategoryModelsStore = _CategoryModelsStore with _$CategoryModelsStore;

abstract class _CategoryModelsStore with Store {
  @observable
  ObservableMap<String, CategoryModel> modelMap = ObservableMap.of({});

  @action
  void insertModel(CategoryModel model) {
    modelMap[model.id] = model;
    _saveToDatabase();
  }

  @action
  void deleteModel(String id) {
    modelMap.remove(id);
    _saveToDatabase();
  }

  @action
  void updateModel(CategoryModel model) {
    if (modelMap[model.id] != null) {
      modelMap[model.id]?.copyFrom(model);
      _saveToDatabase();
    }
  }

  @action
  void clear() {
    modelMap.clear();
  }

  @computed
  bool get isEmpty => modelMap.isEmpty;

  @computed
  List<CategoryModel> get getModelList => modelMap.values.toList();

  CategoryModel? getModel(String id) => modelMap[id];

  Future<void> loadFromDatabase() async {
    modelMap.clear();
    var mapRead =
        await CategoryModelMockDatabase.loadCategoryModelMapFromDatabase();
    if (mapRead != null) {
      //map 读取成功，转换成 taskModelMap
      for (var element in mapRead.values) {
        var model = CategoryModel.fromJson(element);
        modelMap[model.id] = model;
      }

      debugPrint('Category Model Map 读取成功 : ${jsonEncode(modelMap)}');
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

      debugPrint('Category Model Map 读取为空，创建默认数据 : ${jsonEncode(modelMap)}');
    }
  }

  Future<void> _saveToDatabase() async {
    await CategoryModelMockDatabase.storeCategoryModelMapToDatabase(modelMap);
  }
}
