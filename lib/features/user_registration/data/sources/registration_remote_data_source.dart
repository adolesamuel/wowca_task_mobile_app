import 'dart:convert';

import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/user_registration/data/model/registered_user_model.dart';
import 'package:wowca_task/features/user_registration/data/sources/registration_local_data_source.dart';
import 'package:http/http.dart' as http;

abstract class RegistrationRemoteDataSource {
  Future<RegisteredUserModel> registerUser({
    String username,
    String email,
    String firstname,
    String lastname,
    String phone,
    String password,
    String apiKey,
  });
}

class RegistrationRemoteDataSourceImpl implements RegistrationRemoteDataSource {
  final RegistrationLocalDataSource localDataSource;
  final http.Client client;
  final JsonChecker jsonChecker;

  RegistrationRemoteDataSourceImpl(
    this.localDataSource,
    this.client,
    this.jsonChecker,
  );

  @override
  Future<RegisteredUserModel> registerUser({
    String username,
    String email,
    String firstname,
    String lastname,
    String phone,
    String password,
    String apiKey,
  }) async {
    //String url = AppStrings().Something;
    ///API request [URL_ENDPOINT] for user preliminary update
    ///[String url = AppStrings.base + AppStrings.signUp];

    ///Headers [Object] specifying [JSON] as return tyme from api
    // Map<String, String> headers = {'Content-Type': 'application/json'};

    ///Body of the [POST] request
    Map<String, dynamic> body = {
      'okey': apiKey,
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
      'firstname': firstname,
      'lastname': lastname
    };

    ///[final response = await client.post(url, body: body);]

    ///Verify a successfull response from server
    // if (response.statusCode == 200) {
    //   ///Check to verify response data format is json
    //   if (await jsonChecker.isJson(response.body)) {
    //     final data = await json.decode(response.body);
    //     print(data);

    //     ///Verify that the [data] received is [OK] or [F9]
    //     if (data['status'].toString().toLowerCase() == 'ok') {
    //       //
    //       final registeredUserModel =
    //           RegisteredUserModel.fromJson(json.decode(response.body));

    //       ///Cache RegisteredUserInfo returned from the API
    //       localDataSource.cacheRegisteredUserData(registeredUserModel);

    //       return registeredUserModel;
    //     } else {
    //       //Warning, Failure response from server
    //       final title = data['reason']['summary'],
    //           message = data['reason']['details'];

    //       String errorMessage = json.encode({
    //         'title': title,
    //         'message': message,
    //       });

    //   throw errorMessage;
    // }

    //
    //   } else {
    //     //throw FormatException if response is not json format
    //     throw FormatException();
    //   }
    // } else {
    //   //throws Server Failure
    //   throw ServerException();
    // }
  }
}
