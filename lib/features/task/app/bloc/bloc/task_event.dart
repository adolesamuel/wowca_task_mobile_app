part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class CreateTaskEvent extends TaskEvent {
  final String taskId, taskName, taskDescription;
  final bool started, completed;
  final List<String> listOfMediaFileUrls;
  CreateTaskEvent({
    this.taskId,
    this.taskName,
    this.taskDescription,
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
  final String taskId, taskName, taskDescription;
  final bool started, completed;
  final List<String> listOfMediaFileUrls;

  UpdateTaskEvent({
    this.taskId,
    this.taskName,
    this.taskDescription,
    this.started,
    this.completed,
    this.listOfMediaFileUrls,
  });
}
