import 'package:equatable/equatable.dart';

class DeleteModuleSuccessEntity extends Equatable {
  //Returns status of a delete operation
  //ideally failed or successful

  final String status;

  DeleteModuleSuccessEntity(this.status);

  @override
  List<Object> get props => [status];
}
