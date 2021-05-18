import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/core/utils/style.dart';
import 'package:wowca_task/features/user_registration/app/bloc/signup_bloc.dart';
import 'package:wowca_task/features/user_registration/app/page/signIn_page.dart';
import 'package:wowca_task/features/user_registration/app/page/verification_page.dart';
import 'package:wowca_task/injection_container.dart';

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
  TextEditingController _emailController;
  TextEditingController _passwordController;
  final registrationBloc = sl<SignUpBloc>();

  @override
  void initState() {
    super.initState();
    _confirmPasswordFocusNode = FocusNode();
    _confirmPasswordController = TextEditingController();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _confirmPasswordFocusNode.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(20.0),
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppStrings.logoText),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    AppStrings.signUpTitle,
                    style: AppStyles.signUpButton,
                  ),
                ),
                FormBuilder(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: AppStrings.signUpPageName,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.validatorNameText;
                            }
                            return null;
                          },
                          // onChanged: ,onEditingComplete: ,onSaved: ,onReset: ,

                          decoration: InputDecoration(
                              labelText: AppStrings.signUpPageName,
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
                              )),
                              prefixIcon: Icon(Icons.person)),
                        ),
                        SizedBox(
                          height: Quantity.mediumSpace,
                        ),
                        FormBuilderTextField(
                          name: AppStrings.signUpPageEmail,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.validatorEnterEmailText;
                            }
                            if (value.contains('@')) {
                              return null;
                            } else {
                              return AppStrings.validatorValidEmailText;
                            }
                          },
                          // onChanged: ,onEditingComplete: ,onSaved: ,onReset: ,

                          decoration: InputDecoration(
                            labelText: AppStrings.signUpPageEmail,
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
                            )),
                            prefixIcon: Icon(Icons.mail),
                          ),
                        ),
                        SizedBox(
                          height: Quantity.mediumSpace,
                        ),
                        FormBuilderTextField(
                          name: AppStrings.signUpPagePassword,
                          controller: _passwordController,
                          keyboardType: TextInputType.name,
                          obscureText: _obscurePassword,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_confirmPasswordFocusNode),
                          obscuringCharacter: '*',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.validatorValidPasswordText;
                            }
                            if (value != _confirmPasswordController.text) {
                              return AppStrings.validatorSamePasswordText;
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
                            labelText: AppStrings.signUpPagePassword,
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
                            )),
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                        SizedBox(
                          height: Quantity.mediumSpace,
                        ),
                        FormBuilderTextField(
                          name: AppStrings.signUpPageConfirmPassword,
                          controller: _confirmPasswordController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                          focusNode: _confirmPasswordFocusNode,
                          obscureText: _obscurePassword,
                          obscuringCharacter: '*',
                          onEditingComplete: () =>
                              _confirmPasswordFocusNode.unfocus(),
                          // onChanged:  ,onSaved: ,onReset: ,
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
                            labelText: AppStrings.signUpPageConfirmPassword,
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
                            )),
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                        SizedBox(
                          height: Quantity.mediumSpace,
                        ),
                      ],
                    )),

                // Button Row for Register or Sign Up and Verification

                BlocProvider(
                  create: (context) => registrationBloc,
                  child: BlocConsumer<SignUpBloc, SignUpState>(
                    listener: (context, state) {
                      if (state is UserRegisteredState) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings:
                                    RouteSettings(name: '/VerificationPage'),
                                builder: (context) => VerificationPage(
                                      email: _emailController.text,
                                    )));
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              ElevatedButton(
                                child: Text(AppStrings.signUpPageRegisterText),
                                onPressed: () {
                                  //create user object
                                  // push to database
                                  //add linearprogressindicator
                                  //push to page showing user registered and ask for account verification;
                                  //if organization has one admin, say organization has admin already;

                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    print('form validated successfully');
                                    registrationBloc.add(RegisterUserEvent(
                                      name: _nameController.text,
                                      password: _passwordController.text,
                                      email: _emailController.text.trim(),
                                    ));
                                  }
                                  print(
                                      'name: ${_nameController.text} ,  password: ${_passwordController.text} , email: ${_emailController.text}, ');
                                },
                              ),
                              SizedBox(
                                width: Quantity.mediumSpace,
                              ),
                              Text(AppStrings.orText),
                              SizedBox(
                                width: Quantity.mediumSpace,
                              ),
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            settings: RouteSettings(
                                                name: '/SignInPage'),
                                            builder: (context) {
                                              return SignInPage();
                                            }));
                                  },
                                  child: Text(AppStrings.signUpPageSignInText)),
                            ],
                          ),
                          OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        settings: RouteSettings(
                                            name: '/VerificationPage'),
                                        builder: (context) {
                                          return VerificationPage(
                                            email: _emailController.text,
                                          );
                                        }));
                              },
                              child: Text(AppStrings.verificationButtonText)),
                          SizedBox(
                            height: Quantity.mediumSpace,
                          ),
                          state is RegisterUserLoadingState
                              ? LinearProgressIndicator()
                              : state is RegistrationErrorState
                                  ? Text(state.failure.message)
                                  : Text(''),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
