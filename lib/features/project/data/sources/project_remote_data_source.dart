import 'dart:convert';

import 'package:http/http.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/project/data/model/delete_project_success_model.dart';
import 'package:wowca_task/features/project/data/model/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<ProjectModel> createProject({
    String projectName,
    String department,
    String projectDescription,
  });

  Future<List<ProjectModel>> getProjects();
  Future<ProjectModel> getOneProject({String projectId});
  Future<DeleteProjectSuccessModel> deleteProject({String projectId});
  Future<ProjectModel> updateProject({
    String projectId,
    String projectName,
    String department,
    String projectDescription,
    List<String> listOfModules,
  });
}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  final Client client;
  final JsonChecker jsonChecker;

  ProjectRemoteDataSourceImpl(this.client, this.jsonChecker);

  @override
  Future<ProjectModel> createProject({
    String projectName,
    String department,
    String projectDescription,
  }) async {
    String url = AppStrings.base + AppStrings.createProject;

    ///Headers [Object] specifying [JSON] as return tyme from api
    // Map<String, String> headers = {'Content-Type': 'application/json'};

    ///Body of the [POST] request
    Map<String, dynamic> body = {
      'project_title': projectName,
      // 'department': department,
      'project_desc': projectDescription,
    };

    final response = await client.post(
      Uri.parse(url),
      body: body,
    );

    ///Verify if the response is successfull response from server
    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        print(response.body);

        final data = await json.decode(response.body);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          //       //
          print('status succesful');
          ProjectModel createdProject =
              ProjectModel.fromJson(data['response'][0]['data']);

          print('project created');

          return createdProject;
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
  Future<List<ProjectModel>> getProjects() async {
    final url = AppStrings.base + AppStrings.getProjects;

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          final jsonList = data['response'][0]['data'];
          //       //
          final List<ProjectModel> recievedProjectList = jsonList
              .map<ProjectModel>((e) => ProjectModel.fromJson(e))
              .toList();

          print('receivedList : $recievedProjectList');

          return recievedProjectList;
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
  Future<DeleteProjectSuccessModel> deleteProject({String projectId}) async {
    final url = AppStrings.base + AppStrings.deleteProject + '/:$projectId';

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

          return DeleteProjectSuccessModel.fromJson(recieved);
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
  Future<ProjectModel> getOneProject({String projectId}) async {
    final url = AppStrings.base + AppStrings.getOneProject + '/:$projectId';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          //       //
          final ProjectModel recievedProject =
              ProjectModel.fromJson(data['response'][0]['data']);

          print('received : $recievedProject');

          return recievedProject;
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
  Future<ProjectModel> updateProject({
    String projectId,
    String projectName,
    String department,
    String projectDescription,
    List<String> listOfModules,
  }) async {
    String url = AppStrings.base + AppStrings.updateProject + '/:$projectId';

    ///Headers [Object] specifying [JSON] as return tyme from api
    // Map<String, String> headers = {'Content-Type': 'application/json'};

    ///Body of the [POST] request
    Map<String, dynamic> body = {
      '_id': projectId,
      'project_title': projectName,
      'department': department,
      'modules': listOfModules,
      'project_desc': projectDescription,
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
          final updatedProject =
              ProjectModel.fromJson(data['response'][0]['data']);

          return updatedProject;
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
}
