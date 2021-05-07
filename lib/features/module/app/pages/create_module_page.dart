import 'package:flutter/material.dart';
import 'package:wowca_task/core/utils/quantities.dart';

class CreateModulePage extends StatefulWidget {
  @override
  _CreateModulePageState createState() => _CreateModulePageState();
}

class _CreateModulePageState extends State<CreateModulePage> {
  TextEditingController moduleController = TextEditingController();
  bool validate = false;

  @override
  void dispose() {
    moduleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Module'),
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
                'Create a Module',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Quantity.mediumSpace,
              ),
              Text(
                'Module Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextField(
                  controller: moduleController,
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
              OutlinedButton(
                onPressed: () {},
                child: Text('Add Existing Tasks'),
              ),
              SizedBox(
                height: Quantity.mediumSpace,
              ),
              Text(
                'Tasks',
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
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(20.0),
                    ),
                    onPressed: () {},
                    child: Text('Create Module'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
