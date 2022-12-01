// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      json['taskName'] as String,
      DateTime.parse(json['dateTime'] as String),
      $enumDecode(_$ETaskPriorityEnumMap, json['priority']),
      CategoryModel.fromJson(json['categoryModel'] as Map<String, dynamic>),
    )..id = json['id'] as String;

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'taskName': instance.taskName,
      'dateTime': instance.dateTime.toIso8601String(),
      'priority': _$ETaskPriorityEnumMap[instance.priority]!,
      'categoryModel': instance.categoryModel,
    };

const _$ETaskPriorityEnumMap = {
  ETaskPriority.low: 'low',
  ETaskPriority.medium: 'medium',
  ETaskPriority.high: 'high',
  ETaskPriority.emergency: 'emergency',
};
