import 'package:shared_preferences/shared_preferences.dart';

const _key = "shouldShowIntroPage";

Future<bool> shouldShowIntroPage() async {
  var result = false;
  final preferences = await SharedPreferences.getInstance();
  final flag = preferences.getBool(_key);

  if (flag != null) {
    result = flag;
  }

  return result;
}

Future<void> introPagesWereDisplayed() async {
  final preferences = await SharedPreferences.getInstance();
  preferences.setBool(_key, false);
  //TODO: For debug use
  // preferences.setBool(_key, true);
}
