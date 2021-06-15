import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/core/utils/style.dart';
import 'package:wowca_task/features/module/app/bloc/module_bloc.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/injection_container.dart';

class CreateModulePage extends StatefulWidget {
  final ModuleEntity module;

  const CreateModulePage({Key key, this.module}) : super(key: key);
  @override
  _CreateModulePageState createState() => _CreateModulePageState();
}

class _CreateModulePageState extends State<CreateModulePage> {
  final moduleBloc = sl<ModuleBloc>();

  TextEditingController moduleNameController = TextEditingController();
  TextEditingController moduleDescriptionController = TextEditingController();
  bool validate = false;

  @override
  void initState() {
    super.initState();
    widget.module?.moduleName != null
        ? moduleNameController.text = widget.module.moduleName
        : moduleNameController.text = null;
    widget.module?.moduleDescription != null
        ? moduleDescriptionController.text = widget.module.moduleDescription
        : moduleDescriptionController.text = null;
  }

  @override
  void dispose() {
    moduleNameController.dispose();
    moduleDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.module == null
            ? Text(AppStrings.createModuleString)
            : Text(AppStrings.updateModuleString),
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
              Text(
                widget.module == null
                    ? AppStrings.createAModuleString
                    : AppStrings.updateModuleString,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Quantity.mediumSpace,
              ),
              Text(
                AppStrings.moduleNameString,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              //Module Name

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextField(
                  controller: moduleNameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      errorText: validate
                          ? AppStrings.moduleNameValidatorString
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

              //Module Description Text field
              Text(
                AppStrings.descriptionText,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextField(
                  controller: moduleDescriptionController,
                  //expands: true,
                  maxLines: null,
                  minLines: 3,
                  decoration: InputDecoration(
                      errorText: validate
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
                height: Quantity.mediumSpace,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text(AppStrings.addExistingTasksString),
              ),
              SizedBox(
                height: Quantity.mediumSpace,
              ),
              Text(
                AppStrings.tasksString,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Quantity.largeSpace,
              ),
              Text(
                'Percentage Completed: 0%',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Quantity.largeSpace,
              ),
              BlocProvider(
                create: (context) => moduleBloc,
                child: BlocConsumer<ModuleBloc, ModuleState>(
                  listener: (context, state) {
                    if (state is CreatedModuleState) {
                      //wait 2 seconds for  module creation success to show on U.i then pop it
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.pop(context);
                      });
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(20.0),
                              ),
                              onPressed: () {
                                if (moduleNameController.text.isNotEmpty &
                                    moduleDescriptionController
                                        .text.isNotEmpty) {
                                  validate = false;
                                  if (widget.module == null) {
                                    moduleBloc.add(
                                      CreateModuleEvent(
                                        moduleName: moduleNameController.text,
                                        moduleDescription:
                                            moduleDescriptionController.text,
                                      ),
                                    );
                                  }
                                } else {
                                  setState(() {
                                    validate = true;
                                  });
                                }
                              },
                              child: Text(widget.module == null
                                  ? AppStrings.createModuleString
                                  : AppStrings.updateModuleString),
                            )),

                        SizedBox(height: Quantity.mediumSpace),

                        // returns text with error or Task Updated or Task Created Message
                        state is ModuleLoadingState
                            ? LinearProgressIndicator()
                            : state is ErrorModuleState
                                ? Text(
                                    state.failure.message,
                                    style: AppStyles.registrationPageTextStyle,
                                  )
                                : state is CreatedModuleState
                                    ? Text(
                                        AppStrings.moduleCreated,
                                        style:
                                            AppStyles.registrationPageTextStyle,
                                      )
                                    : Text(''),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
