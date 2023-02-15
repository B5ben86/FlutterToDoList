import 'package:json_annotation/json_annotation.dart';
import 'package:uptodo/models/category_model/category_model.dart';
import 'package:uuid/uuid.dart';

part 'task_model.g.dart';

// enum ETaskPriority {
//   one,
//   two,
//   three,
//   four,
//   five,
//   six,
//   seven,
//   eight,
//   nine,
//   ten,
//   eleven,
// }

const MaxPriority = 10;

@JsonSerializable()
class TaskModel {
  String id = const Uuid().v1();
  String taskName;
  String taskDescription;
  DateTime dateTime;
  int priority;
  CategoryModel categoryModel;
  bool? finished = false;

  TaskModel(this.taskName, this.taskDescription, this.dateTime, this.priority,
      this.categoryModel, this.finished);

  void copyFrom(TaskModel taskModel) {
    taskName = taskModel.taskName;
    taskDescription = taskModel.taskDescription;
    dateTime = taskModel.dateTime;
    priority = taskModel.priority;
    categoryModel = taskModel.categoryModel;
    finished = taskModel.finished;
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
