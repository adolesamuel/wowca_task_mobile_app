import 'package:wowca_task/features/company/domain/entity/delete_success_entity.dart';

class DeleteSuccessModel extends DeleteCompSuccessEntity {
  final String status;

  DeleteSuccessModel(this.status) : super(status);

  factory DeleteSuccessModel.fromJson(Map<String, dynamic> data) {
    if (data == null) {
      return DeleteSuccessModel(null);
    } else {
      return DeleteSuccessModel(data['status']);
    }
  }

  Map<String, dynamic> toJson() {
    return {'status': status};
  }
}
