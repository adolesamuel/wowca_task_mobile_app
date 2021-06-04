part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class CreateTaskEvent extends TaskEvent {
  final String taskId, taskName, deadline, taskDescription;
  final bool started, completed;
  final List<File> listOfMediaFileUrls;
  CreateTaskEvent({
    this.taskId,
    @required this.taskName,
    @required this.taskDescription,
    @required this.deadline,
    this.started,
    this.completed,
    this.listOfMediaFileUrls,
  });
}

class GetTasksEvent extends TaskEvent {}

class GetOneTaskEvent extends TaskEvent {
  final String taskId;

  GetOneTaskEvent(this.taskId);
}

class DeleteTaskEvent extends TaskEvent {
  final String taskId;

  DeleteTaskEvent(this.taskId);
}

class FinishTaskEvent extends TaskEvent {
  final String taskId;

  FinishTaskEvent(this.taskId);
}

class ResetTaskEvent extends TaskEvent {
  final String taskId;

  ResetTaskEvent(this.taskId);
}

class StartTaskEvent extends TaskEvent {
  final String taskId;

  StartTaskEvent(this.taskId);
}

class SuspendTaskEvent extends TaskEvent {
  final String taskId;

  SuspendTaskEvent(this.taskId);
}

class UpdateTaskEvent extends TaskEvent {
  final String taskId, taskName, taskDescription, deadline;
  final bool started, completed;
  final List<File> listOfMediaFileUrls;

  UpdateTaskEvent({
    this.taskId,
    this.taskName,
    this.taskDescription,
    this.deadline,
    this.started,
    this.completed,
    this.listOfMediaFileUrls,
  });
}
