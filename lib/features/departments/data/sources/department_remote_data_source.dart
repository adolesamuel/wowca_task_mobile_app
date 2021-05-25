import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/departments/data/models/delete_dept_success_model.dart';
import 'package:wowca_task/features/departments/data/models/dept_model.dart';

abstract class DepartmentRemoteDataSource {
  Future<DeptModel> createDept({
    final String deptDescription,
    final String deptName,
  });

  Future<List<DeptModel>> getDept();
  Future<DeptModel> getOneDept({String deptId});
  Future<DeleteDeptSuccessModel> deleteDept({String deptId});
  Future<DeptModel> updateDept({
    String deptDescription,
    String deptName,
    String departmentId,
    String companyId,
    List<String> listOfUsers,
    List<String> listOfProjects,
  });
}

class DepartmentRemoteDataSourceImpl implements DepartmentRemoteDataSource {
  final http.Client client;
  final JsonChecker jsonChecker;

  DepartmentRemoteDataSourceImpl(this.client, this.jsonChecker);

  @override
  Future<DeptModel> createDept({
    final String deptDescription,
    final String deptName,
  }) async {
    String url = AppStrings.base + AppStrings.createDepartment;

    ///Headers [Object] specifying [JSON] as return tyme from api
    // Map<String, String> headers = {'Content-Type': 'application/json'};

    ///Body of the [POST] request
    Map<String, dynamic> body = {
      'dept_title': deptName,
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
        if (data['status'] == 'OK') {
          //       //
          final createdDept = DeptModel.fromJson(data['response'][0]['data']);

          return createdDept;
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
  Future<List<DeptModel>> getDept() async {
    final url = AppStrings.base + AppStrings.getDepartments;

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          //       //
          final List<DeptModel> recievedDeptList =
              data['response'][0]['data'].map<DeptModel>((e) {
            return DeptModel.fromJson(e);
          }).toList();

          print('receivedList : $recievedDeptList');

          return recievedDeptList;
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
  Future<DeleteDeptSuccessModel> deleteDept({String deptId}) async {
    final url = AppStrings.base + AppStrings.deleteDepartment + '/:$deptId';

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

          return DeleteDeptSuccessModel.fromJson(recieved);
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
  Future<DeptModel> getOneDept({String deptId}) async {
    final url = AppStrings.base + AppStrings.getOneDepartment + '/:$deptId';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //Check to verify response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          //       //
          final DeptModel recievedDept =
              DeptModel.fromJson(data['response'][0]['data']);

          print('received : $recievedDept');

          return recievedDept;
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
  Future<DeptModel> updateDept(
      {String deptDescription,
      String deptName,
      String departmentId,
      String companyId,
      List<String> listOfUsers,
      List<String> listOfProjects}) async {
    String url =
        AppStrings.base + AppStrings.updateDepartment + '/:$departmentId';

    ///Headers [Object] specifying [JSON] as return tyme from api
    // Map<String, String> headers = {'Content-Type': 'application/json'};

    ///Body of the [POST] request
    Map<String, dynamic> body = {
      'dept_title': deptName,
      'description': deptDescription,
      '_id': departmentId,
      'company': companyId,
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
          final updatedDept = DeptModel.fromJson(data['response'][0]['data']);

          return updatedDept;
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
