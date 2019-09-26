import 'package:flutter/material.dart';
import '../constants.dart';

class GradientButtonCustom extends StatelessWidget {
  const GradientButtonCustom({
    this.titleText,
    this.onPressed,
    Key key,
  }) : super(key: key);

  final String titleText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: kGradientGreen),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          titleText,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: 'SourceSansPro',
          ),
        ),
      ),
    );
  }
}
