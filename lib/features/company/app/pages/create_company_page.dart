import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/core/utils/style.dart';
import 'package:wowca_task/features/company/app/bloc/company_bloc.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';
import 'package:wowca_task/injection_container.dart';

class CreateCompanyPage extends StatefulWidget {
  final CompanyEntity company;

  const CreateCompanyPage({Key key, this.company}) : super(key: key);

  @override
  _CreateCompanyPageState createState() => _CreateCompanyPageState();
}

class _CreateCompanyPageState extends State<CreateCompanyPage> {
  // A company is created with a name
  // a logo
  // an address and
  // a company description
  //

  final _companyBloc = sl<CompanyBloc>();

  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _companyAddressController = TextEditingController();
  TextEditingController _companyDescriptionController = TextEditingController();
  List<File> listOfPickedFiles = [];

  bool _isButtonDisabled = false;
  bool _validate = false;

// button to add users to company
// and button to add department to company

  @override
  void initState() {
    super.initState();
    if (widget.company != null) {
      _companyNameController.text = widget.company.companyName;
      _companyAddressController.text = widget.company.companyAddress;
      _companyDescriptionController.text = widget.company.companyDescription;
    } else {
      _companyNameController.text = '';
      _companyAddressController.text = '';
      _companyDescriptionController.text = '';
    }
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _companyAddressController.dispose();
    _companyDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.company == null
            ? Text(AppStrings.createCompanyText)
            : Text(AppStrings.updateCompanyText),
        centerTitle: true,
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

              //Company Name TextField...

              Text(
                AppStrings.companyNameText,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextField(
                  controller: _companyNameController,
                  decoration: InputDecoration(
                      errorText:
                          _validate ? AppStrings.validatorNameText : null,
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

              //Company Address Textfield

              Text(
                AppStrings.companyAddressText,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextField(
                  controller: _companyAddressController,
                  //expands: true,
                  maxLines: null,
                  minLines: 3,
                  decoration: InputDecoration(
                      errorText: _validate
                          ? AppStrings.validatorEnterAddressText
                          : null,
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

              //Company Description textfield

              Text(
                AppStrings.companyDescriptionText,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextField(
                  controller: _companyDescriptionController,
                  //expands: true,
                  maxLines: null,
                  minLines: 3,
                  decoration: InputDecoration(
                      errorText: _validate
                          ? AppStrings.validatorEnterDescriptionText
                          : null,
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

              //! [Logo] Image Selection
              /// has been disabled awaiting api
              /// for company logo selection

              // Text(
              //   AppStrings.logoCompanyText,
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              // Row(
              //   children: [
              //     OutlinedButton(
              //       onPressed: () async {
              //         final file = await pickFile();
              //         listOfPickedFiles.addAll(file);
              //         setState(() {});
              //       },
              //       child: Text(AppStrings.pickImageText),
              //     ),
              //     TextButton(
              //         onPressed: () {
              //           listOfPickedFiles = [];
              //           setState(() {});
              //         },
              //         child: Text(AppStrings.removeText)),
              //   ],
              // ),
              // Column(children: [
              //   for (File item in listOfPickedFiles)
              //     Text('File: ${item.path.toString()}'),
              // ]),
              Divider(
                //height: 50.0,
                thickness: 2.0,
              ),

              //! Add Users to this project
              //this has been commented awaiting API implementation

              // OutlinedButton(
              //   onPressed: () async {},
              //   child: Text(AppStrings.addUsersText),
              // ),

              // Column showing users added to project

              // OutlinedButton(
              //   onPressed: () async {},
              //   child: Text(AppStrings.addDepartmentText),
              // ),

              SizedBox(
                height: Quantity.largeSpace,
              ),
              BlocProvider(
                create: (context) => _companyBloc,
                child: BlocConsumer<CompanyBloc, CompanyState>(
                  listener: (context, state) {
                    if (state is CompanyCreatedState) {
                      //wait 2 seconds for  Company creation success
                      // to show on U.i then pop it

                      Future.delayed(Duration(seconds: 3), () {
                        Navigator.pop(context);
                      });
                    } else if (state is CompanyErrorState) {
                      setState(() {
                        _isButtonDisabled = false;
                      });
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(
                                  Quantity.buttonElevation),
                            ),
                            onPressed: _isButtonDisabled
                                ? null
                                : () {
                                    if (_companyNameController.text.isNotEmpty &
                                        _companyAddressController
                                            .text.isNotEmpty &
                                        _companyDescriptionController
                                            .text.isNotEmpty) {
                                      _validate = false;
                                      setState(() {
                                        _isButtonDisabled = true;
                                      });
                                      if (widget.company == null) {
                                        print('Create Company Event');
                                        _companyBloc.add(CreateCompanyEvent(
                                          companyName:
                                              _companyNameController.text,
                                          companyDescription:
                                              _companyDescriptionController
                                                  .text,
                                          companyAddress:
                                              _companyAddressController.text,
                                        ));

                                        setState(() {
                                          _isButtonDisabled = true;
                                        });
                                      } else {
                                        //run update company details
                                        print('Update company');
                                      }
                                    } else {
                                      setState(() {
                                        _validate = true;
                                      });
                                    }
                                  },
                            child: Text(widget.company == null
                                ? AppStrings.createCompanyText
                                : AppStrings.updateCompanyText),
                          ),
                        ),
                        SizedBox(height: Quantity.mediumSpace),
                        //should show company created stuff when closed
                        state is CompanyLoadingState
                            ? LinearProgressIndicator()
                            : state is CompanyCreatedState
                                ? Text(AppStrings.companyCreatedText)
                                : state is CompanyErrorState
                                    ? Text(
                                        state.failure.message,
                                        style:
                                            AppStyles.registrationPageTextStyle,
                                      )
                                    : Text(''),
                      ],
                    );
                  },
                ),
              ),
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
