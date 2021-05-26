import 'package:wowca_task/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/task/domain/entities/task_entity.dart';
import 'package:wowca_task/features/task/domain/repository/task_repository.dart';
import 'package:wowca_task/features/task/domain/usecases/task_params.dart';

class GetOneTask extends Usecase<TaskEntity, TaskParams> {
  final TaskRepository taskRepository;

  GetOneTask(this.taskRepository);
  @override
  Future<Either<Failure, TaskEntity>> call(TaskParams params) async {
    return await taskRepository.getOneTask(taskId: params.taskId);
  }
}
