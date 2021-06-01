import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/features/module/app/bloc/module_bloc.dart';
import 'package:wowca_task/features/module/app/widgets/module_container.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/injection_container.dart';

class ModuleBody extends StatefulWidget {
  final ModuleEntity module;

  const ModuleBody({Key key, this.module}) : super(key: key);
  @override
  _ModuleBodyState createState() => _ModuleBodyState();
}

class _ModuleBodyState extends State<ModuleBody> {
  final moduleBloc = sl<ModuleBloc>();

  TextEditingController moduleSearchController = TextEditingController();

  BlocProvider<ModuleBloc> buildModuleList(BuildContext context) {
    ///Lay out loading views for when
    ///module is being loaded for the first time
    final loaderView = Center(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        TextField(
          controller: moduleSearchController,
          decoration: InputDecoration(
            labelText: 'Search for Modules',
            suffixIcon: Icon(Icons.search),
          ),
        ),
        Expanded(
          child: BlocProvider(
            create: (context) => moduleBloc..add(GetModulesEvent()),
            child: BlocBuilder<ModuleBloc, ModuleState>(
              builder: (context, state) {
                if (state is ListOfModulesReceivedState) {
                  return ListView.builder(
                      itemCount: state.modules.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ModuleContainer(),
                          ],
                        );
                      });
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
