import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/core/helpers/search_widget.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/module/app/bloc/module_bloc.dart';
import 'package:wowca_task/features/module/app/pages/create_module_page.dart';
import 'package:wowca_task/features/module/app/widgets/module_container.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/injection_container.dart';

class ModulePage extends StatefulWidget {
  final SignedInUserEntity user;

  const ModulePage({Key key, @required this.user}) : super(key: key);
  @override
  _ModulePageState createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  final moduleBloc = sl<ModuleBloc>();
  List<ModuleEntity> moduleList;

  String query = '';

  @override
  void initState() {
    super.initState();
    moduleBloc.add(GetModulesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateModulePage()))
              .then((value) => moduleBloc.add(GetModulesEvent()));
        },
      ),
      body: Container(
        child: Flex(
          direction: Axis.vertical,
          children: [
            _buildSearch(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(AppStrings.modulesString),
            ),
            Expanded(
                child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  BlocProvider(
                    create: (context) => moduleBloc,
                    child: BlocBuilder<ModuleBloc, ModuleState>(
                      buildWhen: (previousState, currentState) =>
                          previousState != currentState,
                      builder: (context, state) {
                        if (state is ModuleLoadingState) {
                          if (moduleList == null || moduleList.isEmpty) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: ListView.builder(
                                  itemCount: moduleList.length,
                                  itemBuilder: (context, index) {
                                    return ModuleContainer(
                                      module: moduleList[index],
                                    );
                                  }),
                            );
                          }
                        } else if (state is ListOfModulesReceivedState) {
                          if (query.isEmpty) {
                            moduleList = state.modules;
                            if (moduleList.isNotEmpty) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: ListView.builder(
                                    itemCount: moduleList.length,
                                    itemBuilder: (context, index) {
                                      return ModuleContainer(
                                        module: moduleList[index],
                                      );
                                    }),
                              );
                            } else {
                              return Center(
                                  child: Text(AppStrings.emptyItemText));
                            }
                          } else {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: ListView.builder(
                                  itemCount: moduleList.length,
                                  itemBuilder: (context, index) {
                                    return ModuleContainer(
                                      module: moduleList[index],
                                    );
                                  }),
                            );
                          }
                        } else {
                          return Center(
                            child: Text('Error Loading Projects'),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search with Module Name',
        onChanged: _searchItems,
      );

  void _searchItems(String query) {
    final moduleListThings = moduleList.where((module) {
      final name = module.moduleName.toLowerCase();
      final searchLower = query.toLowerCase();
      return name.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.moduleList = moduleListThings;
    });
  }
}
