import 'package:equatable/equatable.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';

class ProjectEntity extends Equatable {
  final String projectId;
  final String projectName;
  final String department;
  final List<ModuleEntity> listOfModules;

  ProjectEntity({
    this.projectId,
    this.projectName,
    this.department,
    this.listOfModules,
  });

  @override
  List<Object> get props => [
        projectId,
        projectName,
        department,
        listOfModules,
      ];
}
