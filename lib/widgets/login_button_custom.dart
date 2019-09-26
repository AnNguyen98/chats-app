import 'package:flutter/material.dart';

class LoginButtonCustom extends StatelessWidget {
  const LoginButtonCustom({
    this.titleText,
    this.iconData,
    this.onPressed,
    this.color,
    Key key,
  }) : super(key: key);

  final String titleText;
  final IconData iconData;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(
                  left: 10,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      iconData,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    VerticalDivider(
                      color: Colors.white,
                      width: 2,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                titleText,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: 'SourceSansPro',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
