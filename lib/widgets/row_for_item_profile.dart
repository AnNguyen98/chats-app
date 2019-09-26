import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowForItemProfile extends StatelessWidget {
  const RowForItemProfile({
    this.title,
    this.onPressed,
    Key key,
  }) : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 45,
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                TextSourceSansPro(
                  title: title,
                  fontSize: 14,
                  color: Color(0xFF404040),
                ),
                Spacer(),
                Icon(Icons.navigate_next)
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
