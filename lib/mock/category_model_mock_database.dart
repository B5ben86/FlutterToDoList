import 'dart:convert';

import 'package:uptodo/models/category_model/category_model.dart';
import 'package:uptodo/utility/storage/local_storage.dart';

class CategoryModelMockDatabase {
  static const _storeKey = 'CategoryModelMockDatabase';

  static Future<void> storeCategoryModelMapToDatabase(
      Map<String, CategoryModel> categoryModelMap) async {
    var jsonString = jsonEncode(categoryModelMap);
    await localStorageSave(_storeKey, jsonString);
  }

  static Future<Map<String, dynamic>?>
      loadCategoryModelMapFromDatabase() async {
    Map<String, dynamic>? mapRead;

    var jsonString = await localStorageRead(_storeKey);
    if (jsonString != null) {
      mapRead = jsonDecode(jsonString);
    }

    return mapRead;
  }
}
