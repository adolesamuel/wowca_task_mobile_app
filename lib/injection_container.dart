import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/core/network_info/network_info.dart';
import 'package:http/http.dart' as http;
import 'package:wowca_task/features/departments/app/bloc/department_bloc.dart';
import 'package:wowca_task/features/departments/data/repository/department_repository_impl.dart';
import 'package:wowca_task/features/departments/data/sources/department_local_data_source.dart';
import 'package:wowca_task/features/departments/data/sources/department_remote_data_source.dart';
import 'package:wowca_task/features/departments/domain/repository/dept_repository.dart';
import 'package:wowca_task/features/departments/domain/usecases/create_dept.dart';
import 'package:wowca_task/features/departments/domain/usecases/get_dept.dart';
import 'package:wowca_task/features/module/data/repository/module_repository_impl.dart';
import 'package:wowca_task/features/module/domain/repository/module_repository.dart';
import 'package:wowca_task/features/module/domain/usecases/create_module.dart';
import 'package:wowca_task/features/module/domain/usecases/get_module.dart';
import 'package:wowca_task/features/project/data/repository/project_repository_impl.dart';
import 'package:wowca_task/features/project/domain/repository/project_respository.dart';
import 'package:wowca_task/features/project/domain/usecase/create_project.dart';
import 'package:wowca_task/features/project/domain/usecase/get_projects.dart';
import 'package:wowca_task/features/task/data/repository/task_repository_impl.dart';
import 'package:wowca_task/features/task/data/sources/task_remote_data_source.dart';
import 'package:wowca_task/features/task/domain/repository/task_repository.dart';
import 'package:wowca_task/features/task/domain/usecases/create_task.dart';
import 'package:wowca_task/features/task/domain/usecases/get_task.dart';
import 'package:wowca_task/features/user_registration/app/bloc/signup_bloc.dart';
import 'package:wowca_task/features/user_registration/data/repository/registration_repository.dart';
import 'package:wowca_task/features/user_registration/data/sources/registration_local_data_source.dart';
import 'package:wowca_task/features/user_registration/data/sources/registration_remote_data_source.dart';
import 'package:wowca_task/features/user_registration/domain/repository/registration_repository.dart';
import 'package:wowca_task/features/user_registration/domain/usecases/register_user.dart';
import 'package:wowca_task/features/user_registration/domain/usecases/sign_out_user.dart';
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
        signOutUser: sl(),
      ));

  //Department Bloc
  sl.registerFactory(() => DepartmentBloc(sl(), sl()));

  //Task Bloc
  //

  //Moduele Bloc

  //Project Bloc

  ///////////////////////////////////////////////////////////////////////////////////
  /// Application [USECASES]
  ///////////////////////////////////////////////////////////////////////////////////

  //Registration Useccase
  sl.registerLazySingleton(() => RegisterUser(sl()));
  sl.registerLazySingleton(() => SignInUser(sl()));
  sl.registerLazySingleton(() => VerifyUser(sl()));
  sl.registerLazySingleton(() => SignOutUser(sl()));

  //Department Usecases
  sl.registerLazySingleton(() => CreateDept(sl()));
  sl.registerLazySingleton(() => GetDept(sl()));

  //Task Usecases
  sl.registerLazySingleton(() => CreateTask(sl()));
  sl.registerLazySingleton(() => GetTask(sl()));

  //Project usecases
  sl.registerLazySingleton(() => CreateProject(sl()));
  sl.registerLazySingleton(() => GetProject(sl()));

  //Module usecases
  sl.registerLazySingleton(() => CreateModule(sl()));
  sl.registerLazySingleton(() => GetModule(sl()));

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

  //Department Repository
  sl.registerLazySingleton<DepartmentRepository>(
      () => DepartmentRepositoryImpl(sl(), sl(), sl()));

  //Task repository
  sl.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(sl(), sl(), sl()));

  //Project repository
  sl.registerLazySingleton<ProjectRepository>(
      () => ProjectRepositoryImpl(sl(), sl()));

  //Module repository
  sl.registerLazySingleton<ModuleRepository>(
      () => ModuleRepositoryImpl(sl(), sl()));

  ///////////////////////////////////////////////////////////////////////////////////
  ///Application [DATA_SOURCES]
  ///////////////////////////////////////////////////////////////////////////////////

  //Registration Data Sources
  sl.registerLazySingleton<RegistrationRemoteDataSource>(
      () => RegistrationRemoteDataSourceImpl(sl(), sl()));
  sl.registerLazySingleton<RegistrationLocalDataSource>(
      () => LocalDataSourceImpl(sl()));

  //Department Data Sources
  sl.registerLazySingleton<DepartmentRemoteDataSource>(
      () => DepartmentRemoteDataSourceImpl(sl(), sl()));
  sl.registerLazySingleton<DepartmentLocalDataSource>(
      () => DepartmentLocalDataSourceImpl(sl()));

  //Task Data Source
  sl.registerLazySingleton<TaskRemoteDataSource>(
      () => TaskRemoteDataSourceImpl(sl(), sl()));
  //task local data source

  //Module Data Source

  //Project Data Source

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
