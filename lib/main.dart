import 'package:flutter/material.dart';
import 'package:wowca_task/core/usecase/read_local_pref.dart';
import 'package:wowca_task/features/user_registration/data/sources/registration_local_data_source.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/injection_container.dart' as di;
import 'package:wowca_task/task_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Await [Dependency_injection] processing
  ///using Get_it package
  await di.init();

  ///Get the current users[accessToken] from application's
  ///local data source with shared preferences
  /// not implementing onesignal yet
  /// importance, it should alert users to the state of tasks on the database.
  /// on task complete, task created,
  /// convert cached registered user to cached authenticated user.

  final user = await LocalPreference(di.sl()).readPrefFromObject(
    CACHED_REGISTERED_USER,
  );

  print('main page accesstoken: $user');

  runApp(
    TaskApp(user: user),
  );
}
