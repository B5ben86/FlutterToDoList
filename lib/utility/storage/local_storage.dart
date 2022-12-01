import 'package:shared_preferences/shared_preferences.dart';

Future<bool> localStorageSave(String key, String value) async {
  final preferences = await SharedPreferences.getInstance();

  await preferences.setString(key, value);

  return true;
}

Future<String?> localStorageRead(String key) async {
  final preferences = await SharedPreferences.getInstance();
  final value = preferences.getString(key);
  return value;
}

Future<bool> localStorageDelete(String key) async {
  final preferences = await SharedPreferences.getInstance();
  final result = preferences.remove(key);
  return result;
}
