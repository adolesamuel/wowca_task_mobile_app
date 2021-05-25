import 'package:equatable/equatable.dart';

class DeleteTaskSuccessModel extends Equatable {
  //Returns status of a delete operation
  //ideally failed or successful

  final String status;

  DeleteTaskSuccessModel(this.status);

  @override
  List<Object> get props => [status];
}
