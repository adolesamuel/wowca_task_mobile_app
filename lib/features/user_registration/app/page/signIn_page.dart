import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wowca_task/core/usecase/read_local_pref.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/core/utils/style.dart';
import 'package:wowca_task/features/user_registration/app/bloc/signup_bloc.dart';
import 'package:wowca_task/features/user_registration/app/page/signup_page.dart';
import 'package:wowca_task/features/user_registration/data/sources/registration_local_data_source.dart';
import 'package:wowca_task/injection_container.dart';
import 'package:wowca_task/task_app.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _obscurePassword = true;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  final signInBloc = sl<SignUpBloc>();

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
                Text(AppStrings.logoText),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    AppStrings.signInPageSignInText,
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
                              ))),
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

                          obscuringCharacter: '*',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.validatorValidPasswordText;
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

                BlocProvider(
                  create: (context) => signInBloc,
                  child: BlocConsumer<SignUpBloc, SignUpState>(
                    listener: (context, state) async {
                      if (state is SignedInUserState) {
                        final user =
                            await LocalPreference(sl()).readPrefFromObject(
                          CACHED_REGISTERED_USER,
                        );
                        print('accesstoken from signin $user');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TaskApp(
                                      user: user,
                                    )));
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              ElevatedButton(
                                child: Text(AppStrings.signInPageSignInText),
                                onPressed: () {
                                  //create user object
                                  // push to database
                                  //add linearprogressindicator
                                  //push to page showing user registered and ask for account verification;
                                  //if organization has one admin, say organization has admin already;
                                  print('SignIn Button pressed');
                                  if (_formKey.currentState.validate()) {
                                    print(
                                        'Sign In form validated successfully');
                                    signInBloc.add(SignInUserEvent(
                                        _emailController.text.trim(),
                                        _passwordController.text));
                                  }
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
                                    print('Sign Up button pressed');
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            settings: RouteSettings(
                                                name: '/SignUpPage'),
                                            builder: (context) {
                                              return SignUpPage();
                                            }));
                                  },
                                  child:
                                      Text(AppStrings.signUpPageRegisterText))
                            ],
                          ),
                          SizedBox(
                            height: Quantity.mediumSpace,
                          ),
                          state is RegisterUserLoadingState
                              ? LinearProgressIndicator()
                              : state is SignInErrorState
                                  ? Text(
                                      state.failure.message,
                                      style:
                                          AppStyles.registrationPageTextStyle,
                                    )
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
