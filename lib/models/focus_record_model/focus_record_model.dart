import 'package:json_annotation/json_annotation.dart';

part 'focus_record_model.g.dart';

@JsonSerializable()
class FocusRecordModel {
  DateTime startRecordDateTime;
  DateTime stopRecordDateTime;
  int _focusSeconds = 0;

  FocusRecordModel(this.startRecordDateTime, this.stopRecordDateTime);

  void calculateFocusSeconds() {
    _focusSeconds =
        stopRecordDateTime.difference(startRecordDateTime).inSeconds;
  }

  int getFocusSeconds() {
    return _focusSeconds;
  }

  factory FocusRecordModel.fromJson(Map<String, dynamic> json) =>
      _$FocusRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$FocusRecordModelToJson(this);
}
