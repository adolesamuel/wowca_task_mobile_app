import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wowca_task/features/user_registration/data/model/signed_in_user_model.dart';
import 'package:wowca_task/features/user_registration/data/sources/registration_local_data_source.dart';

import '../../../../core/fixtures/fixture_reader.dart';

class MockSharePreferences extends Mock implements SharedPreferences {}

void main() {
  MockSharePreferences mockSharePreferences;
  LocalDataSourceImpl localDataSource;

  setUp(() {
    mockSharePreferences = MockSharePreferences();
    localDataSource = LocalDataSourceImpl(mockSharePreferences);
  });

  //input
  final SignedInUserModel signedInUserModel = SignedInUserModel(
    name: 'name',
    userId: 'userId',
    orgName: 'orgName',
    role: 'role',
    token: 'token',
    email: 'email',
    activated: 'activated',
  );

  group('Cache UserData', () {
    test('should verify the right registeredUser data is cached', () async {
      //act
      await localDataSource.cacheRegisteredUserData(SignedInUserModel(
        name: 'name',
        userId: 'userId',
        orgName: 'orgName',
        role: 'role',
        token: 'token',
        email: 'email',
        activated: 'activated',
      ));

      //assert
      verify(mockSharePreferences.setString(
          CACHED_REGISTERED_USER, json.encode(signedInUserModel.toJson())));
    });
  });

  group('GetCachedData', () {
    test('should return valid RegisteredUserModel once there is a cached data',
        () async {
      //arrange
      when(mockSharePreferences.getString(any))
          .thenReturn(fixtureReader('cached_registered_user'));
      //act

      final result = await localDataSource.getRegisteredUserData();

      //assert
      verify(mockSharePreferences.getString(CACHED_REGISTERED_USER));
      expect(
          result,
          equals(SignedInUserModel.fromJson(
              json.decode(fixtureReader('cached_registered_user')))));
    });
  });
}
