import 'package:wowca_task/features/project/domain/entity/delete_project_success_entity.dart';

class DeleteProjectSuccessModel extends DeleteProjectSuccessEntity {
  //Returns status of a delete operation
  //ideally failed or successful

  final String status;

  DeleteProjectSuccessModel(this.status) : super(status);

  factory DeleteProjectSuccessModel.fromJson(Map<String, dynamic> data) {
    if (data == null)
      return null;
    else {
      return DeleteProjectSuccessModel(data['status']);
    }
  }
}
