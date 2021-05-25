import 'package:equatable/equatable.dart';

class DeleteDeptSuccessEntity extends Equatable {
  //Returns status of a delete operation
  //ideally failed or successful

  final String status;

  DeleteDeptSuccessEntity(this.status);

  @override
  List<Object> get props => [status];
}
