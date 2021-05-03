import 'dart:io';

import 'package:http/http.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/features/task/data/models/create_task_model.dart';

abstract class TaskRemoteDataSource {
  Future<CreateTaskModel> createTask({
    final String taskId,
    final bool started,
    final bool completed,
    final String taskName,
    final String taskDescription,
    final List<File> listOfMediaFileUrls,
  });
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final Client client;
  final JsonChecker jsonChecker;

  TaskRemoteDataSourceImpl(this.client, this.jsonChecker);

  @override
  Future<CreateTaskModel> createTask({
    final String taskId,
    final bool started,
    final bool completed,
    final String taskName,
    final String taskDescription,
    final List<File> listOfMediaFileUrls,
  }) async {}
}
