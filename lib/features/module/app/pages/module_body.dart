import 'package:flutter/material.dart';
import 'package:wowca_task/features/module/app/widgets/module_container.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';

class ModuleBody extends StatefulWidget {
  final ModuleEntity module;

  const ModuleBody({Key key, this.module}) : super(key: key);
  @override
  _ModuleBodyState createState() => _ModuleBodyState();
}

class _ModuleBodyState extends State<ModuleBody> {
  TextEditingController moduleSearchController = TextEditingController();

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
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ModuleContainer(),
                  ],
                );
              }),
        ),
      ],
    );
    ;
  }
}
