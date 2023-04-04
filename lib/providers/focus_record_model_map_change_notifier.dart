import 'package:flutter/foundation.dart';
import 'package:uptodo/models/focus_record_model/focus_record_model.dart';

class FocusRecordModelMapChangeNotifier
    with ChangeNotifier, DiagnosticableTreeMixin {
  //最多存储一个月的 focusing record
  List<FocusRecordModel> list = [];

  void insertRecord(FocusRecordModel model) {
    list.add(model);
    notifyListeners();
  }

  List<FocusRecordModel> getRecordListOfThisWeek() {
    return list;
  }

  List<FocusRecordModel> getRecordListOfThisMonth() {
    return list;
  }
}
