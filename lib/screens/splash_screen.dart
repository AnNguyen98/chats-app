import 'dart:async';

import 'package:chats_app/screens/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/love_and_chat.png'),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('images/logo_icon.png'),
              ),
              Text(
                'Chats',
                style: TextStyle(
                  fontSize: 70,
                  color: Color.fromRGBO(42, 153, 204, 1.0),
                  fontFamily: 'SourceSansPro',
                ),
              ),
              Text(
                'Chat with your closest friends anywhere in the world',
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(64, 64, 64, 1.0),
                  fontFamily: 'SourceSansPro',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(SplashScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
}
