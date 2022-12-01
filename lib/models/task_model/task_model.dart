import 'package:json_annotation/json_annotation.dart';
import 'package:uptodo/models/task_model/category_model.dart';
import 'package:uuid/uuid.dart';

part 'task_model.g.dart';

enum ETaskPriority {
  low,
  medium,
  high,
  emergency,
}

@JsonSerializable()
class TaskModel {
  String id = const Uuid().v1();
  String taskName;
  DateTime dateTime;
  ETaskPriority priority;
  CategoryModel categoryModel;

  TaskModel(this.taskName, this.dateTime, this.priority, this.categoryModel);

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
