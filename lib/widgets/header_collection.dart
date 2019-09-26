import 'package:flutter/material.dart';

class HeaderCollection extends StatelessWidget {
  const HeaderCollection({
    this.titleTextLeft,
    this.onPressed,
    Key key,
  }) : super(key: key);

  final String titleTextLeft;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23,
      margin: EdgeInsets.only(left: 16, bottom: 15),
      child: Row(
        children: <Widget>[
          Text(
            titleTextLeft,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF343434),
              fontFamily: 'SourceSansPro',
            ),
          ),
          Spacer(),
          MaterialButton(
            minWidth: 40,
            child: Text(
              'See all',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF9A9A9A),
                fontFamily: 'SourceSansPro',
              ),
            ),
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
