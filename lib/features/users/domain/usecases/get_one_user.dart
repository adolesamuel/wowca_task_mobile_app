import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/users/domain/entity/user_entity.dart';
import 'package:wowca_task/features/users/domain/repository/user_repository.dart';

class GetOneUser extends Usecase<UserEntity, GetOneUserParams> {
  final UserRepository userRepository;

  GetOneUser(this.userRepository);

  @override
  Future<Either<Failure, UserEntity>> call(GetOneUserParams params) async {
    return await userRepository.getOneUser();
  }
}

class GetOneUserParams extends Equatable {
  @override
  List<Object> get props => [];
}
