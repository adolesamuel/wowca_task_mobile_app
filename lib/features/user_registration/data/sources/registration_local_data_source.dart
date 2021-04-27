import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/features/user_registration/data/model/registered_user_model.dart';
import 'package:wowca_task/features/user_registration/data/model/signed_in_user_model.dart';

abstract class RegistrationLocalDataSource {
  Future<void> cacheRegisteredUserData(SignedInUserModel userInfo);

  Future<SignedInUserModel> getRegisteredUserData();

  Future<String> extractTokenFromCache();

  Map<String, dynamic> getCachedServerError();

  void cacheServerError(String title, String message);
}

const String CACHED_REGISTERED_USER = 'CACHED_REGISTERED_USER';
const String CACHED_SERVER_ERROR_TITLE = 'CACHED_SERVER_ERROR_TITLE';
const String CACHED_SERVER_ERROR_MESSAGE = 'CACHED_SERVER_ERROR_MESSAGE';

class LocalDataSourceImpl implements RegistrationLocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheRegisteredUserData(SignedInUserModel userInfo) {
    return sharedPreferences.setString(
      CACHED_REGISTERED_USER,
      json.encode(userInfo.toJson()),
    );
  }

  @override
  Future<SignedInUserModel> getRegisteredUserData() {
    String cachedUser = sharedPreferences.getString(
      CACHED_REGISTERED_USER,
    );

    return Future.value(SignedInUserModel.fromJson(json.decode(cachedUser)));
  }

  @override
  Future<String> extractTokenFromCache() {
    if (sharedPreferences.containsKey(CACHED_REGISTERED_USER)) {
      final cachedUser = sharedPreferences.getString(CACHED_REGISTERED_USER);

      return Future.value(json.decode(cachedUser)['access_token']);
    } else {
      throw CacheException();
    }
  }

  @override
  void cacheServerError(String title, String message) {
    sharedPreferences.setString(CACHED_SERVER_ERROR_TITLE, title);
    sharedPreferences.setString(CACHED_SERVER_ERROR_MESSAGE, message);
  }

  @override
  Map<String, dynamic> getCachedServerError() {
    final title = sharedPreferences.getString(CACHED_SERVER_ERROR_TITLE);
    final message = sharedPreferences.getString(CACHED_SERVER_ERROR_MESSAGE);

    return {'title': title, 'message': message};
  }
}
