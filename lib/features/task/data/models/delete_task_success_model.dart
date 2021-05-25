import 'package:wowca_task/features/task/domain/entities/delete_task_success_entity.dart';

class DeleteTaskSuccessModel extends DeleteTaskSuccessEntity {
  //Returns status of a delete operation
  //ideally failed or successful

  final String status;

  DeleteTaskSuccessModel({this.status}) : super(status);

  factory DeleteTaskSuccessModel.fromJson(Map<String, dynamic> data) {
    if (data == null) {
      return DeleteTaskSuccessModel();
    } else {
      return DeleteTaskSuccessModel(status: data['OK']);
    }
  }
}
