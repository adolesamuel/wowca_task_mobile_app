import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wowca_task/core/utils/quantities.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        margin: EdgeInsets.all(20.0),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('!Give this app a logo'),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Create Task Manager Admin Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ),
              FormBuilder(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'Name',
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        // onChanged: ,onEditingComplete: ,onSaved: ,onReset: ,

                        decoration: InputDecoration(
                            labelText: 'Name',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0,
                            ))),
                      ),
                      SizedBox(
                        height: Quantity.mediumSpace,
                      ),
                      FormBuilderTextField(
                        name: 'Organization Name',
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        // onChanged: ,onEditingComplete: ,onSaved: ,onReset: ,

                        decoration: InputDecoration(
                            labelText: 'Organization Name',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0,
                            ))),
                      ),
                      SizedBox(
                        height: Quantity.mediumSpace,
                      ),
                      FormBuilderTextField(
                        name: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.words,
                        // onChanged: ,onEditingComplete: ,onSaved: ,onReset: ,

                        decoration: InputDecoration(
                            labelText: 'Email',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0,
                            ))),
                      ),
                      SizedBox(
                        height: Quantity.mediumSpace,
                      ),
                      FormBuilderTextField(
                        name: 'Password',
                        keyboardType: TextInputType.name,
                        obscureText: true,
                        obscuringCharacter: '*',
                        // onChanged: ,onEditingComplete: ,onSaved: ,onReset: ,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0,
                            ))),
                      ),
                      SizedBox(
                        height: Quantity.mediumSpace,
                      ),
                      FormBuilderTextField(
                        name: 'Confirm Password',
                        keyboardType: TextInputType.name,
                        obscureText: true,
                        obscuringCharacter: '*',
                        // onChanged: ,onEditingComplete: ,onSaved: ,onReset: ,
                        decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0,
                            ))),
                      ),
                    ],
                  )),
              Row(
                children: [
                  ElevatedButton(
                    child: Text('Register'),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: Quantity.mediumSpace,
                  ),
                  Text('OR'),
                  SizedBox(
                    width: Quantity.mediumSpace,
                  ),
                  TextButton(onPressed: () {}, child: Text('Sign In'))
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
