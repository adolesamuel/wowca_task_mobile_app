import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/task/domain/entities/delete_task_success_entity.dart';
import 'package:wowca_task/features/task/domain/entities/task_entity.dart';
import 'package:wowca_task/features/task/domain/usecases/create_task.dart';
import 'package:wowca_task/features/task/domain/usecases/delete_task.dart';
import 'package:wowca_task/features/task/domain/usecases/finish_task.dart';
import 'package:wowca_task/features/task/domain/usecases/get_one_task.dart';
import 'package:wowca_task/features/task/domain/usecases/get_tasks.dart';
import 'package:wowca_task/features/task/domain/usecases/reset_task.dart';
import 'package:wowca_task/features/task/domain/usecases/start_task.dart';
import 'package:wowca_task/features/task/domain/usecases/suspend_task.dart';
import 'package:wowca_task/features/task/domain/usecases/task_params.dart';
import 'package:wowca_task/features/task/domain/usecases/update_task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final CreateTask createTask;
  final DeleteTask deleteTask;
  final FinishTask finishTask;
  final GetTasks getTasks;
  final GetOneTask getOneTask;
  final ResetTask resetTask;
  final StartTask startTask;
  final SuspendTask suspendTask;
  final UpdateTask updateTask;

  TaskBloc({
    this.createTask,
    this.deleteTask,
    this.finishTask,
    this.getTasks,
    this.getOneTask,
    this.resetTask,
    this.startTask,
    this.suspendTask,
    this.updateTask,
  }) : super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if (event is CreateTaskEvent) {
      yield TaskLoadingState();

      final createTaskOrError = await createTask(TaskParams(
        taskId: event.taskId,
        started: event.started,
        completed: event.completed,
        taskName: event.taskName,
        taskDescription: event.taskDescription,
        listOfMediaFileUrls: event.listOfMediaFileUrls,
      ));

      yield createTaskOrError.fold((failure) => ErrorTaskState(failure),
          (task) => CreatedTaskState(task));
    } else if (event is GetTasksEvent) {
      yield TaskLoadingState();
      final getTasksOrError = await getTasks(TaskParams());

      yield getTasksOrError.fold((failure) => ErrorTaskState(failure),
          (tasks) => ListOfTasksReceivedState(tasks));
    } else if (event is GetOneTaskEvent) {
      yield TaskLoadingState();

      final getOneTaskOrError =
          await getOneTask(TaskParams(taskId: event.taskId));

      yield getOneTaskOrError.fold((failure) => ErrorTaskState(failure),
          (task) => ReceivedOneTaskState(task));
    } else if (event is DeleteTaskEvent) {
      yield TaskLoadingState();

      final deleteTaskOrError =
          await deleteTask(TaskParams(taskId: event.taskId));

      yield deleteTaskOrError.fold((failure) => ErrorTaskState(failure),
          (taskStatus) => DeleteTaskSuccessState(taskStatus));
    } else if (event is FinishTaskEvent) {
      yield TaskLoadingState();

      final finishTaskOrError =
          await finishTask(TaskParams(taskId: event.taskId));

      yield finishTaskOrError.fold((failure) => ErrorTaskState(failure),
          (task) => FinishedTaskState(task));
    } else if (event is ResetTaskEvent) {
      yield TaskLoadingState();

      final resetTaskOrError =
          await resetTask(TaskParams(taskId: event.taskId));

      yield resetTaskOrError.fold(
          (failure) => ErrorTaskState(failure), (task) => ResetTaskState(task));
    } else if (event is StartTaskEvent) {
      yield TaskLoadingState();

      final startTaskOrError =
          await startTask(TaskParams(taskId: event.taskId));

      yield startTaskOrError.fold((failure) => ErrorTaskState(failure),
          (task) => StartedTaskState(task));
    } else if (event is SuspendTaskEvent) {
      yield TaskLoadingState();

      final suspendTaskOrError =
          await suspendTask(TaskParams(taskId: event.taskId));

      yield suspendTaskOrError.fold((failure) => ErrorTaskState(failure),
          (task) => SuspendedTaskState(task));
    } else if (event is UpdateTaskEvent) {
      yield TaskLoadingState();

      final updateTaskOrError = await updateTask(TaskParams(
        taskId: event.taskId,
        started: event.started,
        completed: event.completed,
        taskName: event.taskName,
        taskDescription: event.taskDescription,
        listOfMediaFileUrls: event.listOfMediaFileUrls,
      ));

      yield updateTaskOrError.fold((failure) => ErrorTaskState(failure),
          (task) => UpdatedTaskState(task));
    }
  }
}
