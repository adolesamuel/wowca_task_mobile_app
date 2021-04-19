import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/failures/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
