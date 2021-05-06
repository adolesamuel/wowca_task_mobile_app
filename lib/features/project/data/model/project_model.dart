import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';

class ProjectModel extends ProjectEntity {
  final String projectId;
  final String projectName;
  final String department;
  final List<ModuleEntity> listOfModules;

  ProjectModel({
    this.projectId,
    this.projectName,
    this.department,
    this.listOfModules,
  }) : super(
          department: department,
          listOfModules: listOfModules,
          projectId: projectId,
          projectName: projectName,
        );
}
