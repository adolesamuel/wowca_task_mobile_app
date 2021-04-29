import 'dart:convert';

import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/departments/data/models/create_dept_model.dart';
import 'package:http/http.dart' as http;

abstract class DepartmentRemoteDataSource {
  Future<CreatedDeptModel> createDept({
    final String userId,
    final String userRole,
    final String deptName,
  });

  //getdept({});
}

class DepartmentRemoteDataSourceImpl implements DepartmentRemoteDataSource {
  final http.Client client;
  final JsonChecker jsonChecker;

  DepartmentRemoteDataSourceImpl(this.client, this.jsonChecker);

  @override
  Future<CreatedDeptModel> createDept({
    final String userId,
    final String userRole,
    final String deptName,
  }) async {
    String url = AppStrings.base + AppStrings.registerUser;

    ///Headers [Object] specifying [JSON] as return tyme from api
    // Map<String, String> headers = {'Content-Type': 'application/json'};

    ///Body of the [POST] request
    Map<String, dynamic> body = {
      'userId': userId,
      'userRole': userRole,
      'deptName': deptName,
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
        if (data['status'] == 201) {
          //       //
          final createdDept =
              CreatedDeptModel.fromJson(json.decode(response.body));

          return createdDept;
        } else if (data['status'] == 'failed') {
          final createdDeptFail =
              CreatedDeptModel.fromJson(json.decode(response.body));
          return createdDeptFail;
        } else {
          //Warning, Failure response from server
          final title = data['reason']['summary'],
              message = data['reason']['details'];

          String errorMessage = json.encode({
            'title': title,
            'message': message,
          });

          throw errorMessage;
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
