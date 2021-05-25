import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/user_registration/data/model/registered_user_model.dart';
import 'package:wowca_task/features/user_registration/data/model/signed_in_user_model.dart';

abstract class RegistrationRemoteDataSource {
  Future<RegisteredUserModel> registerUser({
    final String email,
    final String password,
    final String name,
  });

  Future<SignedInUserModel> signInUser({String email, String password});
  Future<SignedInUserModel> verifyUser({String code});
}

class RegistrationRemoteDataSourceImpl implements RegistrationRemoteDataSource {
  final http.Client client;
  final JsonChecker jsonChecker;

  RegistrationRemoteDataSourceImpl(
    this.client,
    this.jsonChecker,
  );

  /// reusable function that takes a
  /// url string and map,
  /// queries the api
  /// checks the content and returns required error
  /// or json data
  Future<dynamic> sender({
    @required String url,
    @required Map<String, dynamic> body,
    @required Function(Map<String, dynamic>) run,
  }) async {
    String endpoint = AppStrings.base + url;

    final response = await client.post(
      Uri.parse(endpoint),
      body: body,
    );

    /// verify it the response is successful from server
    if (response.statusCode == 200) {
      /// check if the response data format is json
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        ///Verify that the [data] received is [OK] or [error]
        if (data['status'] == 'OK') {
          // final content = await data['response'][0];
          ///call back function to give you the [response.body]
          ///so you can return it as your choice object type
          return run(data);
        } else {
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
  Future<RegisteredUserModel> registerUser({
    final String email,
    final String password,
    final String name,
  }) async {
    ///Body of the [POST] request
    Map<String, dynamic> body = {
      'name': name,
      'email': email,
      'password': password,
    };

    return await sender(
      url: AppStrings.registerUser,
      body: body,
      run: (data) {
        final content = data['response'][0];
        final registeredUserModel = RegisteredUserModel.fromJson(content);

        return registeredUserModel;
      },
    );
  }

//SignIn user remote data source

  @override
  Future<SignedInUserModel> signInUser({String email, String password}) async {
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };
    return await sender(
      url: AppStrings.signInUser,
      body: body,
      run: (data) {
        final content = data['response'][0]['data'];
        print(content);
        final a = SignedInUserModel.fromJson(content);
        print(a);
        return a;
      },
    );
  }

  ///Verify user remote data source

  @override
  Future<SignedInUserModel> verifyUser({String code}) async {
    return await sender(
      url: AppStrings.verifyUser,
      body: {'code': code},
      run: (data) {
        final signedInUserModel = SignedInUserModel.fromJson(data['data']);
        return signedInUserModel;
      },
    );
  }
}
