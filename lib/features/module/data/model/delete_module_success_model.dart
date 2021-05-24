import 'package:wowca_task/features/module/domain/entity/delete_module_success_entity.dart';

class DeleteModuleSuccessModel extends DeleteModuleSuccessEntity {
  //Returns status of a delete operation
  //ideally failed or successful

  final String status;

  DeleteModuleSuccessModel(this.status) : super(status);
}
