import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    this.obscureText,
    this.titleText,
    this.keyboardType = TextInputType.emailAddress,
    this.isVisibility = false,
    this.onPressedVisibility,
    this.isPassword = false,
    this.controller,
    Key key,
  }) : super(key: key);

  final bool obscureText;
  final String titleText;
  final TextInputType keyboardType;
  final bool isVisibility;
  final bool isPassword;
  final Function onPressedVisibility;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            titleText,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(64, 64, 64, 1.0),
              fontFamily: 'SourceSansPro',
            ),
          ),
          Container(
            height: 45,
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
              decoration: InputDecoration(
                suffixIcon: isPassword
                    ? IconButton(
                        onPressed: onPressedVisibility,
                        icon: isVisibility
                            ? Icon(
                                Icons.visibility,
                                size: 22,
                              )
                            : Icon(
                                Icons.visibility_off,
                                size: 22,
                              ),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
