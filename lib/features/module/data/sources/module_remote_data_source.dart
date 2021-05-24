import 'dart:convert';

import 'package:http/http.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/module/data/model/delete_module_success_model.dart';
import 'package:wowca_task/features/module/data/model/module_model.dart';
import 'package:wowca_task/features/task/domain/entities/get_task_entity.dart';

abstract class ModuleRemoteDataSource {
  Future<ModuleModel> createModule({
    String moduleId,
    String moduleName,
    double percentCompletion,
    List<String> listOfTasks,
    String projectId,
    String moduleDescription,
  });

  Future<List<ModuleModel>> getModules();
  Future<ModuleModel> getOneModule({String moduleId});
  Future<DeleteModuleSuccessModel> deleteModule({String moduleId});
  Future<ModuleModel> updateModule({
    String moduleId,
    String moduleName,
    double percentCompletion,
    List<String> listOfTasks,
    String projectId,
    String moduleDescription,
  });
}

class ModuleRemoteDataSourceImpl implements ModuleRemoteDataSource {
  final Client client;
  final JsonChecker jsonChecker;

  ModuleRemoteDataSourceImpl(this.client, this.jsonChecker);

  @override
  Future<ModuleModel> createModule({
    String moduleId,
    String moduleName,
    double percentCompletion,
    List<String> listOfTasks,
    String projectId,
    String moduleDescription,
  }) async {
    String url = AppStrings.base + AppStrings.createModule;

    ///Headers [Object] specifying [JSON] as return tyme from api
    // Map<String, String> headers = {'Content-Type': 'application/json'};

    ///Body of the [POST] request
    Map<String, dynamic> body = {
      '_id': projectId,
      'module_title': moduleName,
      'project': projectId,
      'tasks': listOfTasks,
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
          final createdDept = ModuleModel.fromJson(data['response'][0]['data']);

          return createdDept;
        } else {
          //Warning, Failure response from server
          final title =
                  data['message'] == null ? 'Unknown Error' : data['message'],
              message = data['errorDetails'] == null
                  ? 'Unknown Error Message'
                  : data['errorDetails'];

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
  Future<DeleteModuleSuccessModel> deleteModule({String moduleId}) {
    // TODO: implement deleteModule
    throw UnimplementedError();
  }

  @override
  Future<List<ModuleModel>> getModules() {
    // TODO: implement getModules
    throw UnimplementedError();
  }

  @override
  Future<ModuleModel> getOneModule({String moduleId}) {
    // TODO: implement getOneModule
    throw UnimplementedError();
  }

  @override
  Future<ModuleModel> updateModule({
    String moduleId,
    String moduleName,
    double percentCompletion,
    List<String> listOfTasks,
    String projectId,
    String moduleDescription,
  }) {
    // TODO: implement updateModule
    throw UnimplementedError();
  }
}
