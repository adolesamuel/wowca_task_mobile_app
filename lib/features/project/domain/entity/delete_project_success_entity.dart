import 'package:equatable/equatable.dart';

class DeleteProjectSuccessEntity extends Equatable {
  //Returns status of a delete operation
  //ideally failed or successful

  final String status;

  DeleteProjectSuccessEntity(this.status);

  @override
  List<Object> get props => [status];
}
