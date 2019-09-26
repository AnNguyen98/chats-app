import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBarProfileItem extends StatelessWidget {
  const NavBarProfileItem({
    this.titleText,
    this.onPressedLeading,
    this.iconAction = CupertinoIcons.back,
    Key key,
  }) : super(key: key);

  final String titleText;
  final Function onPressedLeading;
  final IconData iconAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: Stack(
        children: <Widget>[
          Image(
            height: 140,
            fit: BoxFit.fill,
            image: AssetImage('images/navigation_background.png'),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(left: 20, bottom: 25),
              width: double.infinity,
              child: Text(
                titleText,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'SourceSansPro',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 40, left: 2),
              child: IconButton(
                icon: Icon(
                  iconAction,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: onPressedLeading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
