import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/task/domain/entities/delete_task_success_entity.dart';
import 'package:wowca_task/features/task/domain/repository/task_repository.dart';
import 'package:wowca_task/features/task/domain/usecases/task_params.dart';

class DeleteTask extends Usecase<DeleteTaskSuccessEntity, TaskParams> {
  final TaskRepository taskRepository;

  DeleteTask(this.taskRepository);
  @override
  Future<Either<Failure, DeleteTaskSuccessEntity>> call(
      TaskParams params) async {
    return await taskRepository.deleteTask(taskId: params.taskId);
  }
}
