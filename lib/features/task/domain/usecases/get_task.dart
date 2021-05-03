import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/task/domain/entities/get_task_entity.dart';
import 'package:wowca_task/features/task/domain/repository/task_repository.dart';

class GetTask extends Usecase<List<GetTaskEntity>, GetTaskParams> {
  final TaskRepository taskRepository;

  GetTask(this.taskRepository);

  @override
  Future<Either<Failure, List<GetTaskEntity>>> call(
      GetTaskParams params) async {
    return await taskRepository.getTask();
  }
}

class GetTaskParams extends Equatable {
  GetTaskParams();

  @override
  List<Object> get props => [];
}
