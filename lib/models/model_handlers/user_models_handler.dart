import 'dart:convert';

import 'package:uptodo/mock/task_model_mock_database.dart';
import 'package:uptodo/models/user_model/user_model.dart';
import 'package:uptodo/utility/storage/local_storage.dart';

class UserModelsHandler {
  static final UserModelsHandler _instant = UserModelsHandler._();

  UserModelsHandler._();

  factory UserModelsHandler() => _instant;

  UserModel? _userModel;

  UserModel? getLoginUserModel() {
    return _userModel;
  }

  Future<void> loginSucceedHandle(String userName, String password) async {
    _userModel = UserModel(userName, password);
    await _saveLoginUserMode();

    //登录成功后，从数据库读取所有 task
    await TaskModelMockDatabase.loadTaskModelMapFromDatabase();
  }

  static const _loginUserModelStoreKey = 'LoginUserModelKey';
  Future<void> _saveLoginUserMode() async {
    if (_userModel != null) {
      var jsonString = jsonEncode(_userModel);
      await localStorageSave(_loginUserModelStoreKey, jsonString);
    }
  }

  Future<UserModel?> loadLoginUserMode() async {
    UserModel? userModelRead;
    var jsonString = await localStorageRead(_loginUserModelStoreKey);
    if (jsonString != null) {
      userModelRead = UserModel.fromJsonString(jsonString);
      _userModel = userModelRead;
    }
    return userModelRead;
  }
}
