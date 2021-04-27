import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/user_registration/app/page/signIn_page.dart';
import 'package:wowca_task/features/user_registration/app/page/signup_page.dart';

class VerificationPage extends StatefulWidget {
  final String email;

  //TODO: change default construction with email

  const VerificationPage({Key key, this.email = 'sam@gmail.com'})
      : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
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
                    AppStrings.verificationPageText,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text('Verification code sent to ${widget.email}'),
                ),
                FormBuilder(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: AppStrings.signUpPageEmail,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter verification code';
                            }
                            if (value.length != 6) {
                              return 'Please Enter only 6 digits';
                            } else {
                              return 'Enter a valid verification code';
                            }
                          },
                          // onChanged: ,onEditingComplete: ,onSaved: ,onReset: ,

                          decoration: InputDecoration(
                              labelText:
                                  AppStrings.verificationPageEnterCodeText,
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
                      ],
                    )),

                // Button Row for Register or Sign Up

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          child: Text(AppStrings.verificationButtonText),
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
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: Quantity.smallSpace),
            Text(AppStrings.orText),
            SizedBox(height: Quantity.smallSpace),
            Text(AppStrings.newRegOrgText),
            SizedBox(height: Quantity.smallSpace),
            Row(
              children: [
                OutlinedButton(
                    onPressed: () {
                      print('Sign In button pressed');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              settings: RouteSettings(name: '/SignUpPage'),
                              builder: (context) {
                                return SignUpPage();
                              }));
                    },
                    child: Text(AppStrings.signUpPageRegisterText)),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
