import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:uptodo/mock/focus_record_model_mock_database.dart';
import 'package:uptodo/models/focus_record_model/focus_record_model.dart';

class FocusRecordModelMapChangeNotifier
    with ChangeNotifier, DiagnosticableTreeMixin {
  //最多存储一个月的 focusing record
  List<FocusRecordModel> list = [];

  void insertRecord(FocusRecordModel model) {
    model.calculateFocusSeconds();
    list.add(model);
    notifyListeners();
    _saveToDatabase();
  }

  List<int> getRecordListOfThisWeek() {
    //根据 dateTime 生成本周内每天的持续 focus 时间
    List<int> durationList = [0, 0, 0, 0, 0, 0, 0];
    //1. 获取本周的开始和结束 datetime
    var dateTime = DateTime.now();
    var currentWeekday = dateTime.weekday;
    var startDay = dateTime.subtract(Duration(
      days: currentWeekday,
      hours: dateTime.hour,
      minutes: dateTime.minute,
      seconds: dateTime.second,
      milliseconds: dateTime.millisecond,
      microseconds: dateTime.microsecond,
    ));
    var endDay = dateTime
        .add(Duration(
          days: (7 - currentWeekday),
        ))
        .subtract(
          Duration(
            hours: dateTime.hour,
            minutes: dateTime.minute,
            seconds: dateTime.second,
            milliseconds: dateTime.millisecond,
            microseconds: dateTime.microsecond,
          ),
        );
    for (var record in list) {
      if (record.startRecordDateTime.isAfter(startDay) &&
          record.startRecordDateTime.isBefore(endDay)) {
        durationList[record.startRecordDateTime.weekday] +=
            record.getFocusSeconds();
      }
    }

    // debugPrint(
    //     'startDay = $startDay, endDay = $endDay, weekday = ${dateTime.weekday}');
    // debugPrint('$durationList');
    return durationList;
  }

  List<FocusRecordModel> getRecordListOfThisMonth() {
    //TODO: 根据 dateTime 筛选
    return list;
  }

  Future<void> loadFromDatabase() async {
    list.clear();
    var listRead = await FocusRecordModelMockDatabase.loadFromDatabase();
    if (listRead != null) {
      //map 读取成功，转换成 taskModelMap
      for (var element in listRead) {
        var focusRecordModel = FocusRecordModel.fromJson(element);
        focusRecordModel.calculateFocusSeconds();
        list.add(focusRecordModel);
      }

      debugPrint('FocusRecordModel List 读取成功 : ${jsonEncode(list)}');
    }
  }

  Future<void> _saveToDatabase() async {
    await FocusRecordModelMockDatabase.storeToDatabase(list);
  }
}
