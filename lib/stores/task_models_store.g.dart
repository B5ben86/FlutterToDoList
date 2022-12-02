// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_models_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskModelsStore on _TaskModelsStore, Store {
  Computed<bool>? _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??=
          Computed<bool>(() => super.isEmpty, name: '_TaskModelsStore.isEmpty'))
      .value;
  Computed<List<TaskModel>>? _$getTaskModelListComputed;

  @override
  List<TaskModel> get getTaskModelList => (_$getTaskModelListComputed ??=
          Computed<List<TaskModel>>(() => super.getTaskModelList,
              name: '_TaskModelsStore.getTaskModelList'))
      .value;

  late final _$taskModelMapAtom =
      Atom(name: '_TaskModelsStore.taskModelMap', context: context);

  @override
  ObservableMap<String, TaskModel> get taskModelMap {
    _$taskModelMapAtom.reportRead();
    return super.taskModelMap;
  }

  @override
  set taskModelMap(ObservableMap<String, TaskModel> value) {
    _$taskModelMapAtom.reportWrite(value, super.taskModelMap, () {
      super.taskModelMap = value;
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
  void updateTaskModel(TaskModel taskModel) {
    final _$actionInfo = _$_TaskModelsStoreActionController.startAction(
        name: '_TaskModelsStore.updateTaskModel');
    try {
      return super.updateTaskModel(taskModel);
    } finally {
      _$_TaskModelsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTaskModelFinished(String id, bool finished) {
    final _$actionInfo = _$_TaskModelsStoreActionController.startAction(
        name: '_TaskModelsStore.updateTaskModelFinished');
    try {
      return super.updateTaskModelFinished(id, finished);
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
taskModelMap: ${taskModelMap},
isEmpty: ${isEmpty},
getTaskModelList: ${getTaskModelList}
    ''';
  }
}
