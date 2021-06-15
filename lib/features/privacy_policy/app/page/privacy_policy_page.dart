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
      ),
      body: Center(
          child: Column(
        children: [
          Text('Hello ${user.name}'),
          Text('Under Construction'),
        ],
      )),
    );
  }
}
