import 'package:flutter/material.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';

class DrawerHead extends StatefulWidget {
  final SignedInUserEntity user;

  const DrawerHead({Key key, this.user}) : super(key: key);

  @override
  _DrawerHeadState createState() => _DrawerHeadState();
}

class _DrawerHeadState extends State<DrawerHead> {
  @override
  Widget build(BuildContext context) {
    // add an on details pressed to open user profile page with user data
    return UserAccountsDrawerHeader(
      accountName: Text(widget.user.name),
      accountEmail: Text(widget.user.email),
      currentAccountPicture: CircleAvatar(
        child: Text(
          widget.user.name[0],
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }
}
