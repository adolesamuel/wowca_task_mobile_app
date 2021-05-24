import 'package:wowca_task/features/module/domain/entity/module_entity.dart';

class ModuleModel extends ModuleEntity {
  final String moduleId;
  final String moduleName;
  final double percentCompletion;
  final String moduleDescription;
  final List<String> listOfTasks;
  final String projectId;

  ModuleModel(
      {this.moduleId,
      this.moduleName,
      this.percentCompletion,
      this.moduleDescription,
      this.listOfTasks,
      this.projectId})
      : super(
          moduleId: moduleId,
          moduleName: moduleName,
          percentCompletion: percentCompletion,
          listOfTasks: listOfTasks,
          projectId: projectId,
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
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': moduleId,
      'module_title': moduleName,
      'module_desc': moduleDescription,
      'tasks': listOfTasks,
      'project': projectId,
    };
  }
}
