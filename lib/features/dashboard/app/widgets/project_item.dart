import 'package:wowca_task/features/dashboard/app/widgets/module_item.dart';

class Project {
  final String projectId;
  final String projectName;
  final String department;
  final List<Module> listOfModules;

  Project({
    this.projectId,
    this.projectName,
    this.department,
    this.listOfModules,
  });
}
