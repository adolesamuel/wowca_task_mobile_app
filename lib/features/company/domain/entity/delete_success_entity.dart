import 'package:equatable/equatable.dart';

class DeleteSuccessEntity extends Equatable {
  //Returns status of a delete operation
  //ideally failed or successful

  final String status;

  DeleteSuccessEntity(this.status);

  @override
  List<Object> get props => [status];
}
