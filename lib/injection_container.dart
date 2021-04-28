import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/core/network_info/network_info.dart';
import 'package:http/http.dart' as http;
import 'package:wowca_task/features/user_registration/app/bloc/signup_bloc.dart';
import 'package:wowca_task/features/user_registration/data/repository/registration_repository.dart';
import 'package:wowca_task/features/user_registration/data/sources/registration_local_data_source.dart';
import 'package:wowca_task/features/user_registration/data/sources/registration_remote_data_source.dart';
import 'package:wowca_task/features/user_registration/domain/repository/registration_repository.dart';
import 'package:wowca_task/features/user_registration/domain/usecases/register_user.dart';
import 'package:wowca_task/features/user_registration/domain/usecases/signin_user.dart';
import 'package:wowca_task/features/user_registration/domain/usecases/verification.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  //Registration Bloc
  sl.registerFactory(() => SignUpBloc(
        registerUser: sl(),
        signInUser: sl(),
        verifyUser: sl(),
      ));

  ///////////////////////////////////////////////////////////////////////////////////
  /// Application [USECASES]
  ///////////////////////////////////////////////////////////////////////////////////

  //Registration Useccase
  sl.registerLazySingleton(() => RegisterUser(sl()));
  sl.registerLazySingleton(() => SignInUser(sl()));
  sl.registerLazySingleton(() => VerifyUser(sl()));

  ///////////////////////////////////////////////////////////////////////////////////
  /// Application [REPOSITORIES]
  ///////////////////////////////////////////////////////////////////////////////////

  //Registration Repository
  //
  sl.registerLazySingleton<RegistrationRepository>(
    () => RegistrationRepositoryImpl(
      sl(),
      sl(),
      sl(),
    ),
  );

  ///////////////////////////////////////////////////////////////////////////////////
  ///Application [DATA_SOURCES]
  ///////////////////////////////////////////////////////////////////////////////////

  //Registration Data Sources
  sl.registerLazySingleton<RegistrationRemoteDataSource>(
      () => RegistrationRemoteDataSourceImpl(sl(), sl(), sl()));
  sl.registerLazySingleton<RegistrationLocalDataSource>(
      () => LocalDataSourceImpl(sl()));

  ///////////////////////////////////////////////////////////////////////////////////

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
