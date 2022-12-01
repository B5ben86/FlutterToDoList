import 'package:uptodo/models/user_model/user_model.dart';
import 'package:uptodo/utility/storage/local_storage.dart';

class UserModelMockDatabase {
  // static const String _storeKey = "MockUserModelDatabaseKey";

  static Future<void> storeUserModelToDatabase(
      String userName, String password) async {
    localStorageSave(userName, password);

    // var jsonString = jsonEncode(userModel);
    // localStorageSave(_storeKey, jsonString);
  }

  static Future<UserModel?> loadUserModelFromDatabase(String userName) async {
    UserModel? userModelRead;
    var password = await localStorageRead(userName);
    if (password != null) {
      userModelRead = UserModel(userName, password);
    }
    return userModelRead;
  }
}
