import 'package:http/http.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/features/project/data/model/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<ProjectModel> createProject({
    String projectId,
    String projectName,
    String department,
    List<ModuleEntity> listOfModules,
  });

  Future<List<ProjectModel>> getProject();
}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  final Client client;
  final JsonChecker jsonChecker;

  ProjectRemoteDataSourceImpl(this.client, this.jsonChecker);

  @override
  Future<ProjectModel> createProject({
    String projectId,
    String projectName,
    String department,
    List<ModuleEntity> listOfModules,
  }) async {}

  @override
  Future<List<ProjectModel>> getProject() {}
}
