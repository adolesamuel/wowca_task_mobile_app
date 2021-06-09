import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/core/helpers/search_widget.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/company/app/bloc/company_bloc.dart';
import 'package:wowca_task/features/company/app/pages/create_company_page.dart';
import 'package:wowca_task/features/company/app/widget/company_box_item.dart';
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
  List<CompanyEntity> companyList;

  //Entered Search string
  String query = '';
  //!search works but
  //! doesn't refresh while deleting
  //! query look at this later
  // implement a buildwhen in blocbuilder
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
                  MaterialPageRoute(builder: (context) => CreateCompanyPage()))
              .then((value) => companyBloc.add(GetCompaniesEvent()));
        },
      ),
      body: Container(
        child: Flex(
          direction: Axis.vertical,
          children: [
            _buildSearch(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(AppStrings.companieString,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    BlocProvider(
                      create: (context) => companyBloc,
                      child: BlocBuilder<CompanyBloc, CompanyState>(
                        buildWhen: (previousState, currentState) {
                          return previousState != currentState;
                        },
                        builder: (context, state) {
                          if (state is CompanyLoadingState) {
                            if (companyList == null || companyList.isEmpty) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 150,
                                                childAspectRatio: 3 / 2,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10),
                                        itemCount: companyList.length,
                                        itemBuilder: (context, index) {
                                          return CompanyBoxItem(
                                            company: companyList[index],
                                          );
                                        }),
                                  ),
                                ],
                              );
                            }
                          } else if (state is CompaniesRecievedState) {
                            // determine which to load if
                            // query is not empty or if query
                            // is empty
                            if (query.isEmpty) {
                              companyList = state.companies;
                              return Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 150,
                                                childAspectRatio: 3 / 2,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10),
                                        itemCount: companyList.length,
                                        itemBuilder: (context, index) {
                                          return CompanyBoxItem(
                                            company: companyList[index],
                                          );
                                        }),
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 150,
                                                childAspectRatio: 3 / 2,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10),
                                        itemCount: companyList.length,
                                        itemBuilder: (context, index) {
                                          return CompanyBoxItem(
                                            company: companyList[index],
                                          );
                                        }),
                                  ),
                                ],
                              );
                            }
                          } else {
                            return Center(child: Text('Company Loading Error'));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search with Company Name',
        onChanged: _searchItems,
      );

  void _searchItems(String query) {
    print('CompanyList: $companyList');
    final companyListThings = companyList.where((company) {
      final name = company.companyName.toLowerCase();
      final searchLower = query.toLowerCase();
      return name.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.companyList = companyListThings;
    });
  }
}
