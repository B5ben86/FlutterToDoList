import 'dart:convert';

import 'package:uptodo/models/focus_record_model/focus_record_model.dart';
import 'package:uptodo/utility/storage/local_storage.dart';

class FocusRecordModelMockDatabase {
  static const _storeKey = 'FocusRecordModelMockDatabase';

  static Future<void> storeToDatabase(List<FocusRecordModel> modelList) async {
    var jsonString = jsonEncode(modelList);
    await localStorageSave(_storeKey, jsonString);
  }

  static Future<List<dynamic>?> loadFromDatabase() async {
    List<dynamic>? listRead;

    var jsonString = await localStorageRead(_storeKey);
    if (jsonString != null) {
      listRead = jsonDecode(jsonString);
    }

    return listRead;
  }
}
