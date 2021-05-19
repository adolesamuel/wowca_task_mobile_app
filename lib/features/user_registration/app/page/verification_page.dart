import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/core/utils/style.dart';
import 'package:wowca_task/features/user_registration/app/bloc/signup_bloc.dart';
import 'package:wowca_task/features/user_registration/app/page/signIn_page.dart';
import 'package:wowca_task/features/user_registration/app/page/signup_page.dart';
import 'package:wowca_task/injection_container.dart';

class VerificationPage extends StatefulWidget {
  final String email;

  const VerificationPage({Key key, @required this.email}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _verificationBloc = sl<SignUpBloc>();

  TextEditingController _codeTextFieldController;

  @override
  void initState() {
    super.initState();
    _codeTextFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _codeTextFieldController.dispose();
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
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(AppStrings.logoText),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      AppStrings.verificationPageText,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                  ),
                  widget.email.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text(
                              AppStrings.codeSentToText + ' ${widget.email}'),
                        )
                      : Text(''),
                  FormBuilder(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: AppStrings.signUpPageEmail,
                            controller: _codeTextFieldController,

                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.validatorEnterCodeText;
                              } else if (value.length > 6) {
                                return AppStrings.validatorEnterOnly6Letters;
                              } else
                                return null;
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

                  //verify and Register button

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlocProvider(
                        create: (context) => _verificationBloc,
                        child: BlocConsumer<SignUpBloc, SignUpState>(
                          listener: (context, state) {
                            if (state is VerifiedUserState) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    settings:
                                        RouteSettings(name: '/SignInPage'),
                                    builder: (context) => SignInPage()),
                              );
                            }
                          },
                          builder: (context, state) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    ElevatedButton(
                                      child: Text(
                                          AppStrings.verificationButtonText),
                                      onPressed: () {
                                        print('verification button presssed');
                                        if (_formKey.currentState.validate()) {
                                          print('form validated successfully');
                                          _verificationBloc.add(VerifyUserEvent(
                                              _codeTextFieldController.text));
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Quantity.mediumSpace,
                                ),
                                state is VerificationLoadingState
                                    ? LinearProgressIndicator()
                                    : state is VerificationErrorState
                                        ? Text(
                                            state.failure.message + ' !',
                                            style: AppStyles
                                                .registrationPageTextStyle,
                                          )
                                        : Text(''),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Quantity.mediumSpace),
              Text(
                AppStrings.orText,
                style: AppStyles.registrationPageTextStyle,
              ),
              SizedBox(height: Quantity.smallSpace),
              Text(
                AppStrings.newRegOrgText,
                style: AppStyles.registrationPageTextStyle,
              ),
              SizedBox(height: Quantity.smallSpace),
              Row(
                children: [
                  OutlinedButton(
                      onPressed: () {
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
            ],
          ),
        ),
      ),
    );
  }
}
