import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/core/network_info/network_info.dart';
import 'package:http/http.dart' as http;
import 'package:wowca_task/features/user_registration/app/bloc/signup_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  //Registration Bloc
  sl.registerFactory(() => SignUpBloc(
        registerUser: sl(),
      ));

  /// Application [USECASES]
  ///

  //Registration Useccase

  /// Application [REPOSITORIES]
  ///

  //Registration Repository
  //

  ///Application [DATA_SOURCES]
  ///

  //Registration Data Sources
  //

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<JsonChecker>(() => JsonCheckerImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => json);
}
