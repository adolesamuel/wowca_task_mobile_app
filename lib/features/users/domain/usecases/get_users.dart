import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/users/domain/entity/user_entity.dart';
import 'package:wowca_task/features/users/domain/repository/user_repository.dart';

class GetUsers extends Usecase<List<UserEntity>, GetUsersParams> {
  final UserRepository userRepository;

  GetUsers(this.userRepository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(GetUsersParams params) async {
    return await userRepository.getUsers();
  }
}

class GetUsersParams extends Equatable {
  @override
  List<Object> get props => [];
}
