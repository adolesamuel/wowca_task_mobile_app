import 'dart:convert';

import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/departments/data/models/create_dept_model.dart';
import 'package:http/http.dart' as http;
import 'package:wowca_task/features/departments/data/models/get_dept.dart';

abstract class DepartmentRemoteDataSource {
  Future<CreatedDeptModel> createDept({
    final String deptDescription,
    final String deptTitle,
  });

  Future<List<DeptModel>> getDept();
}

class DepartmentRemoteDataSourceImpl implements DepartmentRemoteDataSource {
  final http.Client client;
  final JsonChecker jsonChecker;

  DepartmentRemoteDataSourceImpl(this.client, this.jsonChecker);

  @override
  Future<CreatedDeptModel> createDept({
    final String deptDescription,
    final String deptTitle,
  }) async {
    String url = AppStrings.base + AppStrings.createDepartment;

    ///Headers [Object] specifying [JSON] as return tyme from api
    // Map<String, String> headers = {'Content-Type': 'application/json'};

    ///Body of the [POST] request
    Map<String, dynamic> body = {
      'dept_title': deptTitle,
      'description': deptDescription,
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
        if (data['status'] == 'success') {
          //       //
          final createdDept = CreatedDeptModel.fromJson(data['data']);

          return createdDept;
        } else {
          //Warning, Failure response from server
          final title = data['title'], message = data['message'];

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

  @override
  Future<List<DeptModel>> getDept() async {
    final url = AppStrings.base + AppStrings.getDepartments;

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OKAY') {
          //       //
          final List<DeptModel> recievedDept = data['createdTasks'].map((e) {
            return DeptModel.fromJson(e);
          }).toList();

          return recievedDept;
        } else {
          //Warning, Failure response from server
          final title = data['status'], message = data['message'];

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
