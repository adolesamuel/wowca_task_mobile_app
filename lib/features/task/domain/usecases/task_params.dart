import 'package:equatable/equatable.dart';

class TaskParams extends Equatable {
  final String taskId;
  final bool started;
  final bool completed;
  final String taskName;
  final String taskDescription;
  final List<String> listOfMediaFileUrls;

  TaskParams({
    this.taskId,
    this.started,
    this.completed,
    this.taskName,
    this.taskDescription,
    this.listOfMediaFileUrls,
  });

  @override
  List<Object> get props => [
        taskId,
        started,
        completed,
        taskName,
        taskDescription,
        listOfMediaFileUrls,
      ];
}
