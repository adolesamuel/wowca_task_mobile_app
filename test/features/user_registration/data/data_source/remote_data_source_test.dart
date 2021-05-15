import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/features/user_registration/data/model/registered_user_model.dart';
import 'package:wowca_task/features/user_registration/data/sources/registration_local_data_source.dart';
import 'package:wowca_task/features/user_registration/data/sources/registration_remote_data_source.dart';

import '../../../../core/fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockJsonChecker extends Mock implements JsonChecker {}

void main() {
  MockHttpClient mockHttpClient;
  RegistrationRemoteDataSource remoteDataSource;
  MockJsonChecker mockJsonChecker;

  setUp(() {
    mockHttpClient = MockHttpClient();
    mockJsonChecker = MockJsonChecker();
    remoteDataSource =
        RegistrationRemoteDataSourceImpl(mockHttpClient, mockJsonChecker);
  });

  group('RegisterUser', () {
    final String name = '', email = '', password = '';

    test(
        'should return  a valid registered user model once connection is successful',
        () async {
      //arrange
      when(mockJsonChecker.isJson(any)).thenAnswer((_) async => true);

      when(mockHttpClient.post(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response(
              fixtureReader('registration_fixture_from_api'), 200));

      //act
      final result = await remoteDataSource.registerUser(
        email: email,
        name: name,
        password: password,
      );

      //assert
      expect(
          result,
          equals(RegisteredUserModel.fromJson(
              json.decode(fixtureReader('registration_fixture_from_api')))));
    });
  });
}
