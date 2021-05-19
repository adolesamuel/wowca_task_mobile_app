import 'dart:convert';

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

  /// write a reusable function that takes a
  /// url string and map,
  /// queries the api
  /// checks the content and returns required error
  /// or json data

  Future<dynamic> sender({
    String url,
    Map<String, dynamic> body,
    Function(Map<String, dynamic>) run,
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
          run(data);
        } else {
          final title =
                  data['message'] == null ? 'Unknown Error' : data['message'],
              message = data['errorDetails'] == null
                  ? 'Unknown Error'
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
  Future<RegisteredUserModel> registerUser({
    final String email,
    final String password,
    final String name,
  }) async {
    //String url = AppStrings().Something;
    ///API request [URL_ENDPOINT] for user preliminary update
    String url = AppStrings.base + AppStrings.registerUser;

    ///Headers [Object] specifying [JSON] as return tyme from api
    // Map<String, String> headers = {'Content-Type': 'application/json'};

    ///Body of the [POST] request
    Map<String, dynamic> body = {
      'name': name,
      'email': email,
      'password': password,
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
          final content = await data['response'][0];
          //       //
          final registeredUserModel = RegisteredUserModel.fromJson(content);

          return registeredUserModel;
        } else if (data['status'] == 'failed') {
          final userEmailUsedData =
              RegisteredUserModel.fromJson(json.decode(response.body));
          return userEmailUsedData;
        } else {
          //Warning, Failure response from server
          final title = data['message'], message = data['errorDetails'];

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

//SignIn user remote data source

  @override
  Future<SignedInUserModel> signInUser({String email, String password}) async {
    String url = AppStrings.base + AppStrings.signInUser;

    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };

    final response = await client.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      if (await jsonChecker.isJson(response.body)) {
        final data = await json.decode(response.body);
        print(data);

        if (data['status'] == 201) {
          final signedInUserModel = SignedInUserModel.fromJson(data["data"]);

          return signedInUserModel;
        } else {
          final title = data['title'], message = data['message'];

          String errorMessage = json.encode({
            'title': title,
            'message': message,
          });

          throw errorMessage;
        }
      } else {
        throw FormatException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SignedInUserModel> verifyUser({String code}) async {
    return await sender(
      url: AppStrings.verifyUser,
      body: {'code': code},
      run: (content) {
        final signedInUserModel = SignedInUserModel.fromJson(content['data']);
        return signedInUserModel;
      },
    );
    //   String url = AppStrings.base + AppStrings.verifyUser;

    //   Map<String, dynamic> body = {
    //     'code': code,
    //   };

    //   final response = await client.post(Uri.parse(url), body: body);

    //   if (response.statusCode == 200) {
    //     if (await jsonChecker.isJson(response.body)) {
    //       final data = await json.decode(response.body);

    //       if (data['status'] == 'OK') {
    //         final signedInUserModel = SignedInUserModel.fromJson(data["data"]);
    //         return signedInUserModel;
    //       } else {
    //         final title =
    //                 data['message'] == null ? 'Unknown Error' : data['message'],
    //             message = data['errorDetails'] == null
    //                 ? 'Unknown Error'
    //                 : data['errorDetails'];

    //         CommonFailure error = CommonFailure(message, title);

    //         throw error;
    //       }
    //     } else {
    //       throw FormatException();
    //     }
    //   } else {
    //     throw ServerException();
    //   }
  }
}
