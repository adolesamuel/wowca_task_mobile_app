import 'package:equatable/equatable.dart';

class DeleteTaskSuccessEntity extends Equatable {
  //Returns status of a delete operation
  //ideally failed or successful

  final String status;

  DeleteTaskSuccessEntity(this.status);

  @override
  List<Object> get props => [status];
}
