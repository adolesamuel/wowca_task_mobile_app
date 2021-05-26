import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/features/task/domain/usecases/create_task.dart';
import 'package:wowca_task/features/task/domain/usecases/delete_task.dart';
import 'package:wowca_task/features/task/domain/usecases/finish_task.dart';
import 'package:wowca_task/features/task/domain/usecases/get_tasks.dart';
import 'package:wowca_task/features/task/domain/usecases/reset_task.dart';
import 'package:wowca_task/features/task/domain/usecases/start_task.dart';
import 'package:wowca_task/features/task/domain/usecases/suspend_task.dart';
import 'package:wowca_task/features/task/domain/usecases/update_task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final CreateTask createTask;
  final DeleteTask deleteTask;
  final FinishTask finishTask;
  final GetTasks getTasks;
  final ResetTask resetTask;
  final StartTask startTask;
  final SuspendTask suspendTask;
  final UpdateTask updateTask;

  TaskBloc({
    this.createTask,
    this.deleteTask,
    this.finishTask,
    this.getTasks,
    this.resetTask,
    this.startTask,
    this.suspendTask,
    this.updateTask,
  }) : super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
