import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CodeVerificationScreen extends StatefulWidget {
  @override
  _CodeVerificationScreenState createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();
  }

  setupTextField(String newValue, int index) {
    setState(() {
      if (newValue.length >= 1) {
        controllers[index].text = newValue.substring(
          newValue.length - 1,
        );
      }

      if (index == 3) {
        FocusScope.of(context).requestFocus(FocusNode());
      } else {
        FocusScope.of(context).nextFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, top: 40),
              width: double.infinity,
              child: Text(
                'My Code is',
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
              margin: EdgeInsets.only(
                top: 62,
                left: 30,
                right: 30,
              ),
              height: 49,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextFieldCodeNumber(
                    autofocus: true,
                    controller: controllers[0],
                    focusNode: focusNodes[0],
                    onChanged: (String newValue) {
                      setupTextField(newValue, 0);
                    },
                  ),
                  TextFieldCodeNumber(
                    focusNode: focusNodes[1],
                    controller: controllers[1],
                    onChanged: (newValue) {
                      setupTextField(newValue, 1);
                    },
                  ),
                  TextFieldCodeNumber(
                    controller: controllers[2],
                    focusNode: focusNodes[2],
                    onChanged: (newValue) {
                      setupTextField(newValue, 2);
                    },
                  ),
                  TextFieldCodeNumber(
                    controller: controllers[3],
                    focusNode: focusNodes[3],
                    onChanged: (newValue) {
                      setupTextField(newValue, 3);
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24, left: 60, right: 60),
              child: Text(
                'Check your SMS messages, we have sent you the pin at +311 223 3244',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF626262),
                  fontFamily: 'SourceSansPro',
                ),
              ),
            ),
            Container(
              width: 121,
              height: 30,
              margin: EdgeInsets.only(
                left: 30,
                top: 40,
                right: 200,
              ),
              child: MaterialButton(
                onPressed: () {
                  print('Didn’t receive SMS?');
                },
                color: Color(0xFFF3F3F3),
                child: Text(
                  'Didn’t receive SMS?',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF626262),
                    fontFamily: 'SourceSansPro',
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 110),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Platform.isAndroid
                        ? CircularProgressIndicator(
                            backgroundColor: Colors.grey,
                            value: 15,
                          )
                        : CupertinoActivityIndicator(
                            radius: 12,
                          ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Processing...',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF969696),
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldCodeNumber extends StatelessWidget {
  const TextFieldCodeNumber({
    Key key,
    @required this.controller,
    this.onChanged,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  final TextEditingController controller;
  final Function onChanged;
  final FocusNode focusNode;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        autofocus: autofocus,
        focusNode: focusNode,
        onChanged: (newvalue) {
          onChanged(newvalue);
        },
        controller: controller,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF1F2F6),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
