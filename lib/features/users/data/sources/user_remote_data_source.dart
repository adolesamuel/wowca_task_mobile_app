import 'package:http/http.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/features/users/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getOneUser();

  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Client client;
  final JsonChecker jsonChecker;

  UserRemoteDataSourceImpl(this.client, this.jsonChecker);

  @override
  Future<UserModel> getOneUser() async {}

  @override
  Future<List<UserModel>> getUsers() {}
}
