import 'package:flutter/material.dart';
import 'package:wowca_task/features/dashboard/app/widgets/module_item.dart';

class DataTableForModule extends StatefulWidget {
  final Module module;

  const DataTableForModule({Key key, this.module}) : super(key: key);
  @override
  _DataTableForModuleState createState() => _DataTableForModuleState();
}

class _DataTableForModuleState extends State<DataTableForModule> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      sortAscending: true,
      sortColumnIndex: 0,
      columns: [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Started')),
        DataColumn(label: Text('Completed')),
      ],
      rows: widget.module.listOfTasks
          .map((task) => DataRow(
                cells: [
                  DataCell(
                    Text(task.taskName),
                  ),
                  DataCell(Text('${task.started}')),
                  DataCell(Text('${task.completed}')),
                ],
              ))
          .toList(),
    );
  }
}
