import 'package:flutter/material.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/features/users/app/widgets/user_page_body.dart';

class UserSearchAndDisplayPage extends StatefulWidget {
  final SignedInUserEntity user;

  const UserSearchAndDisplayPage({Key key, this.user}) : super(key: key);
  @override
  _UserSearchAndDisplayPageState createState() =>
      _UserSearchAndDisplayPageState();
}

class _UserSearchAndDisplayPageState extends State<UserSearchAndDisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: UserPageBody(),
    );
  }
}
