
import 'package:get_it/get_it.dart';
import 'package:uptodo/stores/category_models_store.dart';

void setupGetIt() {
  // GetIt.I.registerSingleton<TaskModelsStore>(TaskModelsStore());
  GetIt.I.registerSingleton<CategoryModelsStore>(CategoryModelsStore());
}
