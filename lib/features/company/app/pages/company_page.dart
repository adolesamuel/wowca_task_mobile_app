import 'package:flutter/material.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';

class CompanyPage extends StatefulWidget {
  final SignedInUserEntity user;
  final DeptEntity dept;
  final CompanyEntity company;

  const CompanyPage({Key key, this.user, this.dept, this.company})
      : super(key: key);

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Companies')),
    );
  }
}
