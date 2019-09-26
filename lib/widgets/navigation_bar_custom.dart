import 'package:flutter/material.dart';

class NavigationBarCustom extends StatelessWidget {
  const NavigationBarCustom({
    this.titleText,
    this.onPressed,
    this.iconAction = Icons.search,
    Key key,
  }) : super(key: key);

  final String titleText;
  final Function onPressed;
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
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(right: 30, bottom: 35),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(
                    iconAction,
                    color: Color(0xFF299BCB),
                  ),
                  onPressed: onPressed,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
