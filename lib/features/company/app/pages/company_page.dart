import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/company/app/bloc/company_bloc.dart';
import 'package:wowca_task/features/company/app/pages/create_company_page.dart';
import 'package:wowca_task/features/company/app/widget/company_box_item.dart';
import 'package:wowca_task/features/company/app/widget/company_search_bar.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/injection_container.dart';

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
  final companyBloc = sl<CompanyBloc>();

  @override
  void initState() {
    super.initState();
    companyBloc.add(GetCompaniesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.companieString)),
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
                    child: Text(AppStrings.companieString,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  BlocProvider(
                    create: (context) => companyBloc,
                    child: BlocConsumer<CompanyBloc, CompanyState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is CompanyLoadingState) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is CompaniesRecievedState) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            //TODO: Give this container an expandable height
                            height: 600.0,
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 150,
                                        childAspectRatio: 3 / 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                itemCount: state.companies.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return CompanyBoxItem(
                                    company: state.companies[index],
                                  );
                                }),
                          );
                        } else {
                          return Center(child: Text('Company Loading Error'));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
