import 'dart:io';

import 'package:chats_app/helper.dart';
import 'package:chats_app/screens/forgot_password_screen.dart';
import 'package:chats_app/screens/sign_up_screen.dart';
import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/gradient_button_custom.dart';
import '../widgets/login_button_custom.dart';
import '../widgets/text_field_custom.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isVisibility = false, obscureText = true;
  TextEditingController edtEmailController, edtPasswordController;

  @override
  void initState() {
    super.initState();
    edtEmailController = TextEditingController();
    edtPasswordController = TextEditingController();
    Helper().isConnectNetwork();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50, left: 24),
              width: double.infinity,
              child: TextSourceSansPro(
                title: 'Sign in',
                textAlign: TextAlign.start,
                color: Color.fromRGBO(64, 64, 64, 1.0),
                fontSize: 30,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35),
              child: Image(
                width: 60,
                height: 60,
                image: AssetImage('images/logo_icon.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 54,
              ),
              child: TextFieldCustom(
                controller: edtEmailController,
                obscureText: false,
                titleText: 'Email',
                isVisibility: false,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 25,
              ),
              child: TextFieldCustom(
                controller: edtPasswordController,
                obscureText: obscureText,
                isPassword: true,
                titleText: 'Password',
                isVisibility: isVisibility,
                onPressedVisibility: () {
                  setState(() {
                    isVisibility = !isVisibility;
                    obscureText = !obscureText;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 39, top: 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot password?',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(155, 155, 155, 1.0),
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 30, top: 30, left: 30),
              child: GradientButtonCustom(
                titleText: 'Sign In',
                onPressed: () {
                  String email = edtEmailController.text;
                  String password = edtPasswordController.text;
                  Helper().loadingDialog(context);
                  Helper().loginWithEmailPassword(email, password,
                      (user, error) {
                    Navigator.pop(context);
                    if (error == null) {
                      print((user as FirebaseUser).email);
                    }
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Dont have an account?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(155, 155, 155, 1),
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(103, 103, 103, 1),
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                child: Text(
                  'Or',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(155, 155, 155, 1),
                    fontFamily: 'SourceSansPro',
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 16, bottom: 8),
              child: LoginButtonCustom(
                onPressed: () {
                  Helper().signInByFacebook(context);
                },
                titleText: 'Login with Facebook',
                iconData: FontAwesomeIcons.facebookF,
                color: Color.fromRGBO(59, 89, 152, 1),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: LoginButtonCustom(
                onPressed: () {
                  Helper().signInWithGoogle(
                    (user, error) {
                      if (error == null) {
                        print(error.toString());
                      } else {
                        Navigator.pop(context);
                        print(user.email);
                      }
                    },
                  );
                },
                titleText: 'Login with Google',
                iconData: FontAwesomeIcons.googlePlus,
                color: Color.fromRGBO(234, 67, 53, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
