import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:wowca_task/core/helpers/helpers.dart';
import 'package:wowca_task/features/module/app/widgets/module_bottom_sheet.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';

class ModuleContainer extends StatefulWidget {
  final ModuleEntity module;

  const ModuleContainer({Key key, this.module}) : super(key: key);

  @override
  _ModuleContainerState createState() => _ModuleContainerState();
}

class _ModuleContainerState extends State<ModuleContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModuleBottomSheet(
          context: context,
          module: widget.module,
        );
      },
      child: PhysicalModel(
        color: Colors.white,
        elevation: 5.0,
        child: Container(
          height: 100.0,
          width: MediaQuery.of(context).size.width * .9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
                      color: Colors.yellow,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                                toCapital(sentence: widget.module.moduleName),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.module.percentCompletion != null
                                ? 'Module Completion: ${widget.module.percentCompletion}'
                                : 'Module Completion: N/A',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: AvatarGlow(
                          glowColor: Colors.green,
                          endRadius: 50.0,
                          child: Material(
                            elevation: 8.0,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
