import 'package:fluttertoast/fluttertoast.dart';

void noticeToast(String toastMessage) {
  Fluttertoast.showToast(
    msg: toastMessage,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
  );
}
