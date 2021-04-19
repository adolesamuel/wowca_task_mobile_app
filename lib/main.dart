import 'package:flutter/material.dart';
import 'package:wowca_task/features/user_registration/app/page/registration_page.dart';

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

  String accessToken = await LocalPreference(di.sl())
      .readPrefFromObject(CACHED_AUTHENTICATED_USER, 'access_token');

  runApp(TaskApp(accessToken: accessToken));
}
