import 'dart:convert';

import 'package:uptodo/models/task_model/task_model.dart';
import 'package:uptodo/utility/storage/local_storage.dart';

class TaskModelMockDatabase {
  // static const String _storeKey = "MockUserModelDatabaseKey";

  static const _storeKey = 'TaskModelMockDatabase';

  static Future<void> storeTaskModelMapToDatabase(
      Map<String, TaskModel> taskModelMap) async {
    var jsonString = jsonEncode(taskModelMap);
    await localStorageSave(_storeKey, jsonString);
  }

  static Future<Map<String, dynamic>?> loadTaskModelMapFromDatabase() async {
    Map<String, dynamic>? mapRead;

    var jsonString = await localStorageRead(_storeKey);
    if (jsonString != null) {
      mapRead = jsonDecode(jsonString);
    }

    return mapRead;
  }
}
