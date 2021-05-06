import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';

class CreateCompanyPage extends StatefulWidget {
  final CompanyEntity company;

  const CreateCompanyPage({Key key, this.company}) : super(key: key);

  @override
  _CreateCompanyPageState createState() => _CreateCompanyPageState();
}

class _CreateCompanyPageState extends State<CreateCompanyPage> {
  // A company is created with a name
  // a logo
  // an address
  // a company description
  //

  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController companyDescriptionController = TextEditingController();
  List<File> listOfPickedFiles = [];
  bool isStarted = false;
  bool isCompleted = false;

// button to add users to company
// and button to add department to company

  @override
  void dispose() {
    companyNameController.dispose();
    companyAddressController.dispose();
    companyDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.company == null
            ? Text('Create Company')
            : Text('Update Company'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          color: Theme.of(context).backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Quantity.mediumSpace,
              ),
              Text(
                'Company Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextField(
                  controller: companyNameController,
                  decoration: InputDecoration(
                      errorStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                            width: 0.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                            width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                            width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 0.5,
                          ))),
                ),
              ),
              SizedBox(
                height: Quantity.mediumSpace,
              ),
              Text(
                'Company Address',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextField(
                  controller: companyAddressController,
                  //expands: true,
                  maxLines: null,
                  minLines: 3,
                  decoration: InputDecoration(
                      errorStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                            width: 0.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                            width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                            width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 0.5,
                          ))),
                ),
              ),
              SizedBox(
                height: Quantity.mediumSpace,
              ),
              Text(
                'Company Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextField(
                  controller: companyDescriptionController,
                  //expands: true,
                  maxLines: null,
                  minLines: 3,
                  decoration: InputDecoration(
                      errorStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                            width: 0.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                            width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                            width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 0.5,
                          ))),
                ),
              ),
              SizedBox(
                height: Quantity.largeSpace,
              ),
              Text(
                'Logo for the Company',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () async {
                      final file = await pickFile();
                      listOfPickedFiles.addAll(file);
                      setState(() {});
                    },
                    child: Text('Pick Image'),
                  ),
                  TextButton(
                      onPressed: () {
                        listOfPickedFiles = [];
                        setState(() {});
                      },
                      child: Text('remove')),
                ],
              ),
              Column(children: [
                for (File item in listOfPickedFiles)
                  Text('File: ${item.path.toString()}'),
              ]),
              Divider(
                height: 50.0,
                thickness: 2.0,
              ),
              OutlinedButton(
                onPressed: () async {},
                child: Text('Add Users'),
              ),
              // Column showing users added to project
              OutlinedButton(
                onPressed: () async {},
                child: Text('Add Department'),
              ),

              SizedBox(
                height: Quantity.largeSpace,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(20.0),
                    ),
                    onPressed: () {
                      print('Create mother effing task');
                      Navigator.pop(context);
                    },
                    child: Text(widget.company == null
                        ? 'Create Company'
                        : 'Update Company'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<File>> pickFile() async {
  final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: [
        'svg',
        'jpg',
        'jpeg',
        'png',
      ]);
  List<File> files = result.paths.map((path) => File(path)).toList();
  return result == null ? <File>[] : files;
}
