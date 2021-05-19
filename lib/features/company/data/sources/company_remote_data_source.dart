import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/company/data/models/company_model.dart';

abstract class CompanyRemoteDataSource {
  Future<CompanyModel> createCompany({
    String companyId,
    String companyName,
    String companyAddress,
    String companyDescription,
    File companyLogo,
    List companyUsers,
    List department,
  });

  Future<List<CompanyModel>> getCompanies();
}

class CompanyRemoteDataSourceImpl implements CompanyRemoteDataSource {
  final Client client;
  final JsonChecker jsonChecker;

  CompanyRemoteDataSourceImpl(this.client, this.jsonChecker);

  /// reusable function that takes a
  /// url string and map,
  /// queries the api
  /// checks the content and returns required error
  /// or json data
  Future<dynamic> sender({
    @required String url,
    @required Function(Map<String, dynamic>) run,
  }) async {
    String endpoint = AppStrings.base + url;

    final response = await client.get(
      Uri.parse(endpoint),
    );

    /// verify it the response is successful from server
    if (response.statusCode == 200) {
      /// check if the response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          // final content = await data['response'][0];
          ///call back function to give you the [response.body]
          ///so you can return it as your choice object type
          return run(data);
        } else {
          final title =
                  data['message'] == null ? 'Unknown Error' : data['message'],
              message = data['errorDetails'] == null
                  ? 'Unknown Error Message'
                  : data['errorDetails'];

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
  Future<CompanyModel> createCompany({
    String companyId,
    String companyName,
    String companyAddress,
    String companyDescription,
    File companyLogo,
    List companyUsers,
    List department,
  }) async {}

  @override
  Future<List<CompanyModel>> getCompanies() async {
    // return await sender(
    //   url: AppStrings.getCompanies,
    //   run: (data) {
    //     List<Map<String, dynamic>> jsonList = data['response'][0]['data'];
    //     print('json list: $jsonList');
    //     final List<CompanyModel> companies =
    //         jsonList.map((value) => CompanyModel.fromJson(value)).toList();
    //     print('comany model list : $companies');
    //     return companies;
    //   },
    // );
    String endpoint = AppStrings.base + AppStrings.getCompanies;

    final response = await client.get(
      Uri.parse(endpoint),
    );

    // verify it the response is successful from server
    if (response.statusCode == 200) {
      /// check if the response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          // final content = await data['response'][0];
          // call back function to give you the [response.body]
          // so you can return it as your choice object type

          final jsonList = data['response'][0]['data'];

          List<CompanyModel> companies = jsonList
              .map<CompanyModel>((item) => CompanyModel.fromJson(item))
              .toList();
          return companies;
        } else {
          final title =
                  data['message'] == null ? 'Unknown Error' : data['message'],
              message = data['errorDetails'] == null
                  ? 'Unknown Error Message'
                  : data['errorDetails'];

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
