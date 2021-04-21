import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/features/user_registration/app/page/signIn_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _obscurePassword = true;
  FocusNode _confirmPasswordFocusNode;
  TextEditingController _confirmPasswordController;
  TextEditingController _nameController;
  TextEditingController _organizationController;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _confirmPasswordFocusNode = FocusNode();
    _confirmPasswordController = TextEditingController();
    _nameController = TextEditingController();
    _organizationController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _confirmPasswordFocusNode.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _organizationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'Name',
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Name';
                          }
                          return null;
                        },
                        // onChanged: ,onEditingComplete: ,onSaved: ,onReset: ,

                        decoration: InputDecoration(
                            labelText: 'Name',
                            errorStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0),
                            ),
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
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an Organization name';
                          }
                          return null;
                        },
                        // onChanged: ,onEditingComplete: ,onSaved: ,onReset: ,

                        decoration: InputDecoration(
                            labelText: 'Organization Name',
                            errorStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0),
                            ),
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
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an Email';
                          }
                          if (value.contains('@')) {
                            return null;
                          } else {
                            return 'Enter a valid Email';
                          }
                        },
                        // onChanged: ,onEditingComplete: ,onSaved: ,onReset: ,

                        decoration: InputDecoration(
                            labelText: 'Email',
                            errorStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0),
                            ),
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
                        obscureText: _obscurePassword,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_confirmPasswordFocusNode),
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          if (value != _confirmPasswordController.text) {
                            return 'Passwords are not the same';
                          } else {
                            return null;
                          }
                        },
                        // onChanged: ,onEditingComplete: ,onSaved: ,onReset: ,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Theme.of(context).accentColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (_obscurePassword)
                                    _obscurePassword = false;
                                  else
                                    _obscurePassword = true;
                                });
                              },
                            ),
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
                        controller: _confirmPasswordController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        focusNode: _confirmPasswordFocusNode,
                        obscureText: _obscurePassword,
                        obscuringCharacter: '*',
                        // onChanged: ,onEditingComplete: ,onSaved: ,onReset: ,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Theme.of(context).accentColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (_obscurePassword)
                                    _obscurePassword = false;
                                  else
                                    _obscurePassword = true;
                                });
                              },
                            ),
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
                      SizedBox(
                        height: Quantity.mediumSpace,
                      ),
                    ],
                  )),

              // Button Row for Register or Sign Up

              Row(
                children: [
                  ElevatedButton(
                    child: Text('Register'),
                    onPressed: () {
                      print('Register Button pressed');
                      _formKey.currentState.validate();
                    },
                  ),
                  SizedBox(
                    width: Quantity.mediumSpace,
                  ),
                  Text('OR'),
                  SizedBox(
                    width: Quantity.mediumSpace,
                  ),
                  TextButton(
                      onPressed: () {
                        print('Sign In button pressed');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: RouteSettings(name: '/SignInPage'),
                                builder: (context) {
                                  return SignInPage();
                                }));
                      },
                      child: Text('Sign In'))
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
