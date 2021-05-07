import 'package:flutter/material.dart';
import 'package:wowca_task/features/company/app/pages/create_company_page.dart';
import 'package:wowca_task/features/company/app/widget/company_box_item.dart';
import 'package:wowca_task/features/company/app/widget/company_search_bar.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';
import 'package:wowca_task/features/dashboard/app/widgets/grid_widget.dart';
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateCompanyPage()));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CompanySearchBar(),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('User\'s companies ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  BasicGrid(gap: 5.0, columnCount: 4, children: [
                    //this container is supposed to load an item from network
                    //change the default company image and name

                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                  ]),
                  Divider(
                    thickness: 2.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Popular Companies',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  BasicGrid(gap: 5.0, columnCount: 4, children: [
                    //this container is supposed to load an item from network
                    //change the default company image and name

                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                    CompanyBoxItem(),
                  ]),
                  SizedBox(
                    height: 48.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
