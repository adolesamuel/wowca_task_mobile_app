import 'package:equatable/equatable.dart';

class DeleteCompSuccessEntity extends Equatable {
  //Returns status of a delete operation
  //ideally failed or successful

  final String status;

  DeleteCompSuccessEntity(this.status);

  @override
  List<Object> get props => [status];
}
