import 'package:get_it/get_it.dart';
import 'package:uptodo/stores/task_models_store.dart';

void setupGetIt() {
  GetIt.I.registerSingleton<TaskModelsStore>(TaskModelsStore());
}
