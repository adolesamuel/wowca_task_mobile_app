import 'dart:convert';

import 'package:http/http.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/module/data/model/delete_module_success_model.dart';
import 'package:wowca_task/features/module/data/model/module_model.dart';

abstract class ModuleRemoteDataSource {
  Future<ModuleModel> createModule({
    String moduleId,
    String moduleName,
    String moduleDescription,
    String projectId,
  });

  Future<List<ModuleModel>> getModules();
  Future<ModuleModel> getOneModule({String moduleId});
  Future<DeleteModuleSuccessModel> deleteModule({String moduleId});
}

class ModuleRemoteDataSourceImpl implements ModuleRemoteDataSource {
  final Client client;
  final JsonChecker jsonChecker;

  ModuleRemoteDataSourceImpl(this.client, this.jsonChecker);

  @override
  Future<ModuleModel> createModule({
    String moduleId,
    String moduleName,
    String moduleDescription,
    String projectId,
  }) async {
    String url = AppStrings.base + AppStrings.createModule;

    ///Headers [Object] specifying [JSON] as return tyme from api
    // Map<String, String> headers = {'Content-Type': 'application/json'};

    ///Body of the [POST] request
    Map<String, dynamic> body = {
      '_id': moduleId,
      'module_title': moduleName,
      'module_desc': moduleDescription,
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
          final createdModule =
              ModuleModel.fromJson(data['response'][0]['data']);

          return createdModule;
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
  Future<DeleteModuleSuccessModel> deleteModule({String moduleId}) async {
    final url = AppStrings.base + AppStrings.deleteModule + '/:$moduleId';

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

          return DeleteModuleSuccessModel.fromJson(recieved);
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
  Future<List<ModuleModel>> getModules() async {
    final url = AppStrings.base + AppStrings.getModules;

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          //       //
          final List<ModuleModel> recievedModuleList =
              data['response'][0]['data'].map<ModuleModel>((e) {
            return ModuleModel.fromJson(e);
          }).toList();

          print('receivedList : $recievedModuleList');

          return recievedModuleList;
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
  Future<ModuleModel> getOneModule({String moduleId}) async {
    final url = AppStrings.base + AppStrings.getOneModule + '/:$moduleId';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          //       //
          final ModuleModel receivedModule =
              ModuleModel.fromJson(data['response'][0]['data']);

          print('received : $receivedModule');

          return receivedModule;
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
  Future<ModuleModel> updateModule({
    String moduleId,
    String moduleName,
    double percentCompletion,
    List<String> listOfTasks,
    String projectId,
    String moduleDescription,
  }) async {
    String url = AppStrings.base + AppStrings.updateModule + '/:$moduleId';

    ///Headers [Object] specifying [JSON] as return tyme from api
    // Map<String, String> headers = {'Content-Type': 'application/json'};

    ///Body of the [POST] request
    Map<String, dynamic> body = {
      '_id': moduleId,
      'module_title': moduleName,
      'module_desc': moduleDescription,
      'percent_completion': percentCompletion,
      'tasks': listOfTasks,
      'project': projectId,
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
          final updatedModule =
              ModuleModel.fromJson(data['response'][0]['data']);

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
