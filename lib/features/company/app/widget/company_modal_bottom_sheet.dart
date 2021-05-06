import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wowca_task/features/company/app/pages/create_company_page.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';

//Useful
Future<dynamic> showCompanyBottomSheet({
  @required BuildContext context,
  CompanyEntity company,
}) {
  return showBarModalBottomSheet(
      elevation: 5.0,
      expand: true,
      context: context,
      builder: (context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) =>
                Scaffold(
              appBar: AppBar(
                title: company == null
                    ? Text('Company Name')
                    : Text(company.companyName),
              ),
              body: SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //TODO: give this page an Image widget
                      // Container(
                      //   clipBehavior: Clip.hardEdge,
                      //   child: company == null
                      //       ? CircleAvatar(
                      //           child: Text('No Image'),
                      //         )
                      //       : Image.file(company.companyLogo),
                      // ),
                      Text(
                        'Company Address',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SelectableText(company == null
                          ? 'No Company Address'
                          : company.companyAddress),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Company Description',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      //Selectable widget to show the task description
                      SelectableText(company == null
                          ? 'No Company description'
                          : company.companyDescription),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Departments',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Users',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      Text(
                        'Status',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      //Update task elevated button
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CreateCompanyPage()));
                            },
                            child: Text('Update Company Details')),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
}
