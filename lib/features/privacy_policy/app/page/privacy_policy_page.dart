import 'package:flutter/material.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';

class PrivacyPolicyPage extends StatelessWidget {
  final SignedInUserEntity user;
  const PrivacyPolicyPage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello ${user.name}'),
          SizedBox(
            height: 8.0,
          ),
          Text('This page is Under Construction'),
        ],
      )),
    );
  }
}
