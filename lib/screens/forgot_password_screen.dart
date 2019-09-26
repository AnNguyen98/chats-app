import 'package:chats_app/screens/number_verification_screen.dart';
import 'package:chats_app/widgets/gradient_button_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController edtEmailController;

  @override
  void initState() {
    super.initState();
    edtEmailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              width: 24,
              margin: EdgeInsets.only(top: 10, left: 2),
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(
                  CupertinoIcons.back,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              width: double.infinity,
              child: Text(
                'Forget Password',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(64, 64, 64, 1.0),
                  fontFamily: 'SourceSansPro',
                ),
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
              margin: EdgeInsets.only(top: 40, left: 24, right: 24),
              child: Text(
                'No problem. Enter the email address you used to register your account and we’ll send you a reset link',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(98, 98, 98, 1),
                  fontFamily: 'SourceSansPro',
                ),
              ),
            ),
            Container(
              height: 49,
              margin: EdgeInsets.symmetric(horizontal: 42, vertical: 45),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color(
                    0xFF979797,
                  ),
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextField(
                controller: edtEmailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFB4B4B4),
                    fontFamily: 'SourceSansPro',
                  ),
                  hintText: 'Enter your email',
                  filled: true,
                  fillColor: Color(0xFFF1F2F6),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: GradientButtonCustom(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NumberVerificationScreen(),
                    ),
                  );
                },
                titleText: 'Continue',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
