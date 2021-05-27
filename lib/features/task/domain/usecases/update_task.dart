import 'package:wowca_task/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/task/domain/entities/task_entity.dart';
import 'package:wowca_task/features/task/domain/repository/task_repository.dart';
import 'package:wowca_task/features/task/domain/usecases/task_params.dart';

class UpdateTask extends Usecase<TaskEntity, TaskParams> {
  final TaskRepository taskRepository;

  UpdateTask(this.taskRepository);
  @override
  Future<Either<Failure, TaskEntity>> call(TaskParams params) async {
    return await taskRepository.updateTask(
      taskId: params.taskId,
      started: params.started,
      completed: params.completed,
      deadline: params.deadline,
      taskName: params.taskName,
      taskDescription: params.taskDescription,
      listOfMediaFileUrls: params.listOfMediaFileUrls,
    );
  }
}
