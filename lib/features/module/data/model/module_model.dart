import 'package:wowca_task/features/module/domain/entity/module_entity.dart';

class ModuleModel extends ModuleEntity {
  final String moduleId;
  final String moduleName;
  final double percentCompletion;
  final String moduleDescription;
  final List<String> listOfTasks;
  final String projectId;
  final String createdDate;
  final String updatedDate;

  ModuleModel({
    this.moduleId,
    this.moduleName,
    this.percentCompletion = 0,
    this.moduleDescription,
    this.listOfTasks,
    this.projectId,
    this.createdDate,
    this.updatedDate,
  }) : super(
          moduleId: moduleId,
          moduleName: moduleName,
          percentCompletion: percentCompletion,
          listOfTasks: listOfTasks,
          projectId: projectId,
          createdDate: createdDate,
          updatedDate: updatedDate,
        );

  factory ModuleModel.fromJson(Map<String, dynamic> data) {
    if (data == null)
      return ModuleModel();
    else {
      return ModuleModel(
        moduleId: data['_id'],
        moduleName: data['module_title'],
        //percentCompletion: data['percent_completion'],
        moduleDescription: data['module_desc'],
        listOfTasks: data['tasks'],
        projectId: data['project'],
        createdDate: data['createdAt'],
        updatedDate: data['updatedAt'],
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': moduleId,
      'module_title': moduleName,
      'module_desc': moduleDescription,
      'percent_completion': percentCompletion,
      'tasks': listOfTasks,
      'project': projectId,
      'createdAt': createdDate,
      'updatedAt': updatedDate,
    };
  }
}
