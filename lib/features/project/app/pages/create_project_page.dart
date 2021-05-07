import 'package:flutter/material.dart';
import 'package:wowca_task/core/utils/quantities.dart';

class CreateProjectPage extends StatefulWidget {
  @override
  _CreateProjectPageState createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  TextEditingController projectNameTextController = TextEditingController();
  bool validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Project'),
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
                  'Create a Project',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Quantity.mediumSpace,
                ),
                Text(
                  'Project Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: TextField(
                    controller: projectNameTextController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        errorText: validate ? 'Enter a name' : null,
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
                SizedBox(
                  height: Quantity.mediumSpace,
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Add Existing Modules '),
                ),
                SizedBox(
                  height: Quantity.mediumSpace,
                ),
                Text(
                  'Modules',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Quantity.mediumSpace,
                ),
                SizedBox(
                  height: Quantity.mediumSpace,
                ),
                Text(
                  'Projects',
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                      onPressed: () {},
                      child: Text('Create Project'),
                    ))
              ],
            ),
          ),
        ));
  }
}
