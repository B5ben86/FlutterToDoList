// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_models_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskModelsStore on _TaskModelsStore, Store {
  late final _$_taskModelMapAtom =
      Atom(name: '_TaskModelsStore._taskModelMap', context: context);

  @override
  Map<String, TaskModel> get _taskModelMap {
    _$_taskModelMapAtom.reportRead();
    return super._taskModelMap;
  }

  @override
  set _taskModelMap(Map<String, TaskModel> value) {
    _$_taskModelMapAtom.reportWrite(value, super._taskModelMap, () {
      super._taskModelMap = value;
    });
  }

  late final _$_TaskModelsStoreActionController =
      ActionController(name: '_TaskModelsStore', context: context);

  @override
  void insertTaskModel(TaskModel taskModel) {
    final _$actionInfo = _$_TaskModelsStoreActionController.startAction(
        name: '_TaskModelsStore.insertTaskModel');
    try {
      return super.insertTaskModel(taskModel);
    } finally {
      _$_TaskModelsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTaskModel(String id) {
    final _$actionInfo = _$_TaskModelsStoreActionController.startAction(
        name: '_TaskModelsStore.deleteTaskModel');
    try {
      return super.deleteTaskModel(id);
    } finally {
      _$_TaskModelsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_TaskModelsStoreActionController.startAction(
        name: '_TaskModelsStore.clear');
    try {
      return super.clear();
    } finally {
      _$_TaskModelsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
