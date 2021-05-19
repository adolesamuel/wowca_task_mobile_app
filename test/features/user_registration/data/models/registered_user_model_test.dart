import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:wowca_task/features/user_registration/data/model/registered_user_model.dart';

import '../../../../core/fixtures/fixture_reader.dart';

void main() {
  final String title = 'OK', message = 'token';
  final int status = 201;

  final RegisteredUserModel registeredUserModel = RegisteredUserModel(
    title: title,
    message: message,
    status: status.toString(),
  );

  group('FromJson:', () {
    test('Should return registered user model from map', () {
      //arrange
      final Map<String, dynamic> jsonDecoded = json.decode(
        fixtureReader('registration_fixture_from_api'),
      );

      //act
      final result = RegisteredUserModel.fromJson(jsonDecoded);

      //assert
      expect(result, registeredUserModel);
    });
  });

  group('ToJson:', () {
    test('return valid map from RegisteredUserModel', () {
      //act
      final result = registeredUserModel.toJson();

      //assert
      expect(result, {"title": "OK", "message": "token", "status": 201});
    });
  });
}
