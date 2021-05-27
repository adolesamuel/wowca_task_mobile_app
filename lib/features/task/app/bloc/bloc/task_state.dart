part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoadingState extends TaskState {}

class ErrorTaskState extends TaskState {
  final Failure failure;

  ErrorTaskState(this.failure);
}

class ListOfTasksReceivedState extends TaskState {
  final List<TaskEntity> tasks;

  ListOfTasksReceivedState(this.tasks);
}

class CreatedTaskState extends TaskState {
  final TaskEntity task;

  CreatedTaskState(this.task);
}

class ReceivedOneTaskState extends TaskState {
  final TaskEntity task;

  ReceivedOneTaskState(this.task);
}

class DeleteTaskSuccessState extends TaskState {
  final DeleteTaskSuccessEntity taskDeleted;

  DeleteTaskSuccessState(this.taskDeleted);
}

class FinishedTaskState extends TaskState {
  final TaskEntity task;

  FinishedTaskState(this.task);
}

class ResetTaskState extends TaskState {
  final TaskEntity task;

  ResetTaskState(this.task);
}

class StartedTaskState extends TaskState {
  final TaskEntity task;

  StartedTaskState(this.task);
}

class SuspendedTaskState extends TaskState {
  final TaskEntity task;

  SuspendedTaskState(this.task);
}

class UpdatedTaskState extends TaskState {
  final TaskEntity task;

  UpdatedTaskState(this.task);
}
