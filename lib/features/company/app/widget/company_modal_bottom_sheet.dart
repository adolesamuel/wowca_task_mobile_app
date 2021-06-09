import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/company/app/bloc/company_bloc.dart';
import 'package:wowca_task/features/company/app/pages/create_company_page.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';

//Useful
Future<dynamic> showCompanyBottomSheet({
  @required BuildContext context,
  CompanyEntity company,
}) {
  final companyBloc = BlocProvider.of<CompanyBloc>(context);
  print('Company:${company.companyId}');
  return showBarModalBottomSheet(
    elevation: 5.0,
    expand: true,
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (BuildContext context, StateSetter setModalState) => Scaffold(
        appBar: AppBar(
          title: company == null
              ? Text(AppStrings.companyNameText)
              : Text(company.companyName),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //include widget to hold company Logo in the center
                Text(
                  'Company Address',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SelectableText(company == null
                    ? AppStrings.noCompanyAddressText
                    : company?.companyAddress),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  AppStrings.companyDescriptionText,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                //Selectable widget to show the task description
                SelectableText(company == null
                    ? AppStrings.noCompanyDescriptionText
                    : company?.companyDescription),
                SizedBox(
                  height: 8.0,
                ),
                //Departments
                Text(
                  company.department == null
                      ? AppStrings.departmentText + ': 0'
                      : AppStrings.departmentText +
                          ': ${company.department?.length}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8.0,
                ),
                //Users
                Text(
                  company.companyUsers == null
                      ? AppStrings.usersText + ': 0'
                      : AppStrings.usersText +
                          ': ${company.companyUsers?.length}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                Divider(
                  thickness: 2,
                  height: 50,
                ),

                //Update Company elevated button
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateCompanyPage(
                                      company: company,
                                    )));
                      },
                      child: Text(AppStrings.updateCompanyDetailsButtonText)),
                ),
                SizedBox(
                  height: 16.0,
                ),

                //Delete Company elevated Button
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red.shade900)),
                    onPressed: () {
                      return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(AppStrings.confirmDeleteText),
                                content: Text(AppStrings.sureToDeleteText),
                                actions: [
                                  //Delete confirmation dialog button
                                  OutlinedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.red.shade900),
                                          foregroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      onPressed: () {
                                        companyBloc.add(DeleteCompanyEvent(
                                            company.companyId));
                                        companyBloc.add(GetCompaniesEvent());
                                        // to close dialog
                                        Navigator.pop(context);
                                        // to close modal bottom sheet
                                        Navigator.pop(context);
                                      },
                                      child: Text(AppStrings.deleteText)),
                                ],
                              ));
                    },
                    child: Text('Delete Company'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
