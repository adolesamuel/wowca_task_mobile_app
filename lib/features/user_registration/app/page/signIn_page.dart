import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/features/user_registration/app/page/signIn_page.dart';
import 'package:wowca_task/features/user_registration/app/page/signup_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _obscurePassword = true;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                    'Sign In',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                ),
                FormBuilder(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      children: [
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

                          obscuringCharacter: '*',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
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
                        SizedBox(
                          height: Quantity.mediumSpace,
                        ),
                      ],
                    )),

                // Button Row for Register or Sign Up

                Column(
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          child: Text('Sign In'),
                          onPressed: () {
                            //create user object
                            // push to database
                            //add linearprogressindicator
                            //push to page showing user registered and ask for account verification;
                            //if organization has one admin, say organization has admin already;
                            print('Register Button pressed');
                            if (_formKey.currentState.validate()) {
                              print('form validated successfully');
                            }
                          },
                        ),
                        SizedBox(
                          width: Quantity.mediumSpace,
                        ),
                        Text('OR'),
                        SizedBox(
                          width: Quantity.mediumSpace,
                        ),
                        OutlinedButton(
                            onPressed: () {
                              print('Sign In button pressed');
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      settings:
                                          RouteSettings(name: '/SignUpPage'),
                                      builder: (context) {
                                        return SignUpPage();
                                      }));
                            },
                            child: Text('Register'))
                      ],
                    ),
                    Text('a new organization'),
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
