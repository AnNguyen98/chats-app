import 'package:chats_app/models/code_country.dart';
import 'package:chats_app/screens/code_verification_screen.dart';
import 'package:chats_app/widgets/gradient_button_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class NumberVerificationScreen extends StatefulWidget {
  @override
  _NumberVerificationScreenState createState() =>
      _NumberVerificationScreenState();
}

class _NumberVerificationScreenState extends State<NumberVerificationScreen> {
  TextEditingController edtNumberController;
  String dropdownValue = '';
  List<CodeCountry> countryCodes = [];
  @override
  void initState() {
    super.initState();
    edtNumberController = TextEditingController();
    getCodeCountry();
  }

  void getCodeCountry() {
    phonePrefixCodeWithCountry.forEach((items) {
      items.forEach((key, value) {
        CodeCountry codeCountry = CodeCountry(code: value, country: key);
        countryCodes.add(codeCountry);
      });
    });
    // countryCodes.sort((code1, code2) {
    //   return code1.code.compareTo(code2.code);
    // });

    dropdownValue = countryCodes[0].code;
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
                'My Mobile Number is',
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
                margin:
                    EdgeInsets.only(left: 20, top: 62, right: 20, bottom: 25),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(
                      0xFF979797,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 73,
                      height: 49,
                      color: Color(0xFFD8D8D8),
                      child: Center(
                        child: DropdownButton<String>(
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          icon: Icon(Icons.keyboard_arrow_down),
                          value: dropdownValue,
                          items: countryCodes.map<DropdownMenuItem<String>>(
                            (value) {
                              return DropdownMenuItem<String>(
                                value: value.code,
                                child: Container(
                                  width: 40,
                                  child: Text(
                                    '+' + value.code,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF595959),
                                      fontFamily: 'SourceSansPro',
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 49,
                        child: TextField(
                          controller: edtNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFB4B4B4),
                              fontFamily: 'SourceSansPro',
                            ),
                            hintText: 'Mobile number',
                            filled: true,
                            fillColor: Color(0xFFF1F2F6),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Container(
              margin: EdgeInsets.only(left: 75, right: 75),
              child: Text(
                'We need your mobile number to verify your account and to be able to get in touch.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(98, 98, 98, 1),
                  fontFamily: 'SourceSansPro',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 40,
              ),
              child: GradientButtonCustom(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CodeVerificationScreen(),
                    ),
                  );
                },
                titleText: 'Continue',
              ),
            )
          ],
        ),
      ),
    );
  }
}
