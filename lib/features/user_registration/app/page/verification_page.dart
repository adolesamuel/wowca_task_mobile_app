import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/core/utils/strings.dart';
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
                  Text('!Give this app a logo'),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      AppStrings.verificationPageText,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
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
                            controller: _codeTextFieldController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter verification code';
                              } else if (value.length > 6) {
                                return 'Please Enter only 6 digits';
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
                                        print('Register Button pressed');
                                        if (_formKey.currentState.validate()) {
                                          print('form validated successfully');
                                          _verificationBloc.add(VerifyUserEvent(
                                              _codeTextFieldController.text));
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      width: Quantity.mediumSpace,
                                    ),
                                  ],
                                ),
                                if (state is VerificationLoadingState)
                                  LinearProgressIndicator(),
                              ],
                            );
                          },
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
