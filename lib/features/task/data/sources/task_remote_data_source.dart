import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/task/data/models/delete_task_success_model.dart';
import 'package:wowca_task/features/task/data/models/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<TaskModel> createTask({
    String taskId,
    bool started,
    bool completed,
    String taskName,
    String taskDescription,
    List<File> listOfMediaFileUrls,
  });

  Future<List<TaskModel>> getTasks();
  Future<DeleteTaskSuccessModel> deleteTask({String taskId});
  Future<TaskModel> finishTask({String taskId});
  Future<TaskModel> getOneTask({String taskId});
  Future<TaskModel> resetTask({String taskId});
  Future<TaskModel> startTask({String taskId});
  Future<TaskModel> suspendTask({String taskId});
  Future<TaskModel> updateTask({
    String taskId,
    bool started,
    bool completed,
    String taskName,
    String taskDescription,
    List<File> listOfMediaFileUrls,
  });
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final Client client;
  final JsonChecker jsonChecker;

  TaskRemoteDataSourceImpl(this.client, this.jsonChecker);

  @override
  Future<TaskModel> createTask({
    final String taskId,
    final bool started,
    final bool completed,
    final String taskName,
    final String taskDescription,
    final List<File> listOfMediaFileUrls,
  }) async {
    String url = AppStrings.base + AppStrings.createTask;

    ///Headers [Object] specifying [JSON] as return tyme from api
    // Map<String, String> headers = {'Content-Type': 'application/json'};

    ///TODO: add more fields to Body of the [POST] request
    Map<String, dynamic> body = {
      '_id': taskId,
      'task_title': taskName,
      'task_desc': taskDescription,
    };

    final response = await client.post(
      Uri.parse(url),
      body: body,
    );

    ///Verify if the response is successfull response from server
    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          //       //
          final createdTask = TaskModel.fromJson(data['response'][0]['data']);

          return createdTask;
        } else {
          //Warning, Failure response from server
          final title = data['message'] ?? 'Unknown Error',
              message = data['errorDetails'] ?? 'Unknown Error Message';

          CommonFailure error = CommonFailure(message, title);

          throw error;
        }
      } else {
        //throw FormatException if response is not json format
        throw FormatException();
      }
    } else {
      //throws Server Failure
      throw ServerException();
    }
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    final url = AppStrings.base + AppStrings.getTasks;

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          //       //
          final List<TaskModel> recievedTaskList =
              data['response'][0]['data'].map<TaskModel>((e) {
            return TaskModel.fromJson(e);
          }).toList();

          print('receivedList : $recievedTaskList');

          return recievedTaskList;
        } else {
          //Warning, Failure response from server, provide default if unknown
          final title = data['message'] ?? 'Unknown Error',
              message = data['errorDetails'] ?? 'Unknown Error Message';

          CommonFailure error = CommonFailure(message, title);

          throw error;
        }
      } else {
        throw FormatException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<DeleteTaskSuccessModel> deleteTask({String taskId}) async {
    final url = AppStrings.base + AppStrings.deleteTask + '/:$taskId';

    final response = await client.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          //       //
          final recieved = data;

          return DeleteTaskSuccessModel.fromJson(recieved);
        } else {
          //Warning, Failure response from server
          final title = data['message'] ?? 'Unknown Error',
              message = data['errorDetails'] ?? 'Unknown Error Message';

          CommonFailure error = CommonFailure(message, title);

          throw error;
        }
      } else {
        throw FormatException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TaskModel> finishTask({String taskId}) async {
    final url = AppStrings.base + AppStrings.finishTask + '/:$taskId';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          //       //
          final TaskModel receivedTask =
              TaskModel.fromJson(data['response'][0]['data']);

          print('received : $receivedTask');

          return receivedTask;
        } else {
          //Warning, Failure response from server
          final title = data['message'] ?? 'Unknown Error',
              message = data['errorDetails'] ?? 'Unknown Error Message';
          CommonFailure error = CommonFailure(message, title);

          throw error;
        }
      } else {
        throw FormatException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TaskModel> getOneTask({String taskId}) async {
    final url = AppStrings.base + AppStrings.getOneTask + '/:$taskId';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          //       //
          final TaskModel receivedTask =
              TaskModel.fromJson(data['response'][0]['data']);

          print('received : $receivedTask');

          return receivedTask;
        } else {
          //Warning, Failure response from server
          final title = data['message'] ?? 'Unknown Error',
              message = data['errorDetails'] ?? 'Unknown Error Message';
          CommonFailure error = CommonFailure(message, title);

          throw error;
        }
      } else {
        throw FormatException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TaskModel> resetTask({String taskId}) async {
    final url = AppStrings.base + AppStrings.resetTask + '/:$taskId';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          //       //
          final TaskModel receivedTask =
              TaskModel.fromJson(data['response'][0]['data']);

          print('received : $receivedTask');

          return receivedTask;
        } else {
          //Warning, Failure response from server
          final title = data['message'] ?? 'Unknown Error',
              message = data['errorDetails'] ?? 'Unknown Error Message';
          CommonFailure error = CommonFailure(message, title);

          throw error;
        }
      } else {
        throw FormatException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TaskModel> startTask({String taskId}) async {
    final url = AppStrings.base + AppStrings.startTask + '/:$taskId';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          //       //
          final TaskModel receivedTask =
              TaskModel.fromJson(data['response'][0]['data']);

          print('received : $receivedTask');

          return receivedTask;
        } else {
          //Warning, Failure response from server
          final title = data['message'] ?? 'Unknown Error',
              message = data['errorDetails'] ?? 'Unknown Error Message';
          CommonFailure error = CommonFailure(message, title);

          throw error;
        }
      } else {
        throw FormatException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TaskModel> suspendTask({String taskId}) async {
    final url = AppStrings.base + AppStrings.suspendTask + '/:$taskId';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          //       //
          final TaskModel receivedTask =
              TaskModel.fromJson(data['response'][0]['data']);

          print('received : $receivedTask');

          return receivedTask;
        } else {
          //Warning, Failure response from server
          final title = data['message'] ?? 'Unknown Error',
              message = data['errorDetails'] ?? 'Unknown Error Message';
          CommonFailure error = CommonFailure(message, title);

          throw error;
        }
      } else {
        throw FormatException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TaskModel> updateTask(
      {String taskId,
      bool started,
      bool completed,
      String taskName,
      String taskDescription,
      List<File> listOfMediaFileUrls}) async {
    String url = AppStrings.base + AppStrings.updateTask + '/:$taskId';

    ///Headers [Object] specifying [JSON] as return tyme from api
    // Map<String, String> headers = {'Content-Type': 'application/json'};

    ///Body of the [POST] request
    Map<String, dynamic> body = {
      '_id': taskId,
      'task_title': taskName,
      'task_desc': taskDescription,
    };

    final response = await client.post(
      Uri.parse(url),
      body: body,
    );

    ///Verify if the response is successfull response from server
    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          //       //
          final updatedModule = TaskModel.fromJson(data['response'][0]['data']);

          return updatedModule;
        } else {
          //Warning, Failure response from server
          final title = data['message'] ?? 'Unknown Error',
              message = data['errorDetails'] ?? 'Unknown Error Message';

          CommonFailure error = CommonFailure(message, title);

          throw error;
        }
      } else {
        throw FormatException();
      }
    } else {
      throw ServerException();
    }
  }
}
