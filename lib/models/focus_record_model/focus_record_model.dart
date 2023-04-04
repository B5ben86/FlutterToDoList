import 'package:json_annotation/json_annotation.dart';

part 'focus_record_model.g.dart';

@JsonSerializable()
class FocusRecordModel {
  DateTime startRecordDateTime;
  int focusSeconds;

  FocusRecordModel(this.startRecordDateTime, this.focusSeconds);

  factory FocusRecordModel.fromJson(Map<String, dynamic> json) =>
      _$FocusRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$FocusRecordModelToJson(this);
}
