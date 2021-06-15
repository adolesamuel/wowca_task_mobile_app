import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wowca_task/features/module/app/bloc/module_bloc.dart';
import 'package:wowca_task/features/module/app/pages/create_module_page.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/features/project/app/pages/create_project_page.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';

//Useful
Future<dynamic> showModuleBottomSheet({
  @required BuildContext context,
  ModuleEntity module,
}) {
  final moduleBloc = BlocProvider.of<ModuleBloc>(context);
  return showBarModalBottomSheet(
      elevation: 5.0,
      expand: true,
      context: context,
      builder: (context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) =>
                Scaffold(
              appBar: AppBar(
                title: module == null
                    ? Text('Module Name')
                    : Text(module.moduleName),
              ),
              body: SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Users',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Number of Tasks',
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
                                          CreateModulePage()));
                            },
                            child: Text('Update module Details')),
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
