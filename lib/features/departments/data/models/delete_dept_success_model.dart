import 'package:wowca_task/features/departments/domain/entity/delete_dept_success_entity.dart';

class DeleteDeptSuccessModel extends DeleteDeptSuccessEntity {
  //Returns status of a delete operation
  //ideally failed or successful

  final String status;

  DeleteDeptSuccessModel(this.status) : super(status);

  factory DeleteDeptSuccessModel.fromJson(Map<String, dynamic> data) {
    if (data == null)
      return null;
    else {
      return DeleteDeptSuccessModel(data['status']);
    }
  }
}
