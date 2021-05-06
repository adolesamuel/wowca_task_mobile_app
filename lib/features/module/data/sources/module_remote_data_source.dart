import 'package:http/http.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/features/module/data/model/module_model.dart';
import 'package:wowca_task/features/task/domain/entities/get_task_entity.dart';

abstract class ModuleRemoteDataSource {
  Future<ModuleModel> createModule({
    String moduleId,
    String moduleName,
    double percentCompletion,
    List<GetTaskEntity> listOfTasks,
    String projectName,
  });

  Future<List<ModuleModel>> getModule();
}

class ModuleRemoteDataSourceImpl implements ModuleRemoteDataSource {
  final Client client;
  final JsonChecker jsonChecker;

  ModuleRemoteDataSourceImpl(this.client, this.jsonChecker);

  @override
  Future<ModuleModel> createModule({
    String moduleId,
    String moduleName,
    double percentCompletion,
    List<GetTaskEntity> listOfTasks,
    String projectName,
  }) async {}

  @override
  Future<List<ModuleModel>> getModule() {}
}
