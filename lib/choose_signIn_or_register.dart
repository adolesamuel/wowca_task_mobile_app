import 'package:flutter/material.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/user_registration/app/page/signIn_page.dart';
import 'package:wowca_task/features/user_registration/app/page/signup_page.dart';

class SignInOrRegisterChooser extends StatefulWidget {
  @override
  _SignInOrRegisterChooserState createState() =>
      _SignInOrRegisterChooserState();
}

class _SignInOrRegisterChooserState extends State<SignInOrRegisterChooser>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Duration imageAnimationDuration = Duration(seconds: 30);

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
          duration: imageAnimationDuration,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter:
                ColorFilter.mode(Colors.blue.withOpacity(0.5), BlendMode.color),
            image: AssetImage(AppStrings.loginImage),
            fit: BoxFit.cover,
          )),
          constraints: BoxConstraints.expand(),
          //width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('!Give this app a Logo'),
              Text(
                'Complete Projects The Right Way...',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                      child: Text('Register')),
                  SizedBox(
                    width: 8.0,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
