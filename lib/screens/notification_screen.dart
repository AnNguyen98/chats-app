import 'dart:io';

import 'package:chats_app/widgets/nav_bar_profile_item.dart';
import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificarionScreen extends StatefulWidget {
  @override
  _NotificarionScreenState createState() => _NotificarionScreenState();
}

class _NotificarionScreenState extends State<NotificarionScreen> {
  bool isNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            NavBarProfileItem(
              titleText: 'Notifications',
              onPressedLeading: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            RowNotification(
              value: isNotification,
              title: 'Message notifications',
              onChanged: (value) {
                setState(() {
                  isNotification = value;
                });
              },
            ),
            RowNotification(
              title: 'Calls notifications',
              value: isNotification,
              onChanged: (value) {
                setState(() {
                  isNotification = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class RowNotification extends StatelessWidget {
  const RowNotification({
    this.onChanged,
    this.value,
    this.title,
    Key key,
  }) : super(key: key);

  final bool value;
  final Function onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
              Platform.isIOS
                  ? CupertinoSwitch(
                      value: value,
                      onChanged: (value) {
                        onChanged(value);
                      },
                    )
                  : Switch(
                      value: value,
                      onChanged: (value) {
                        onChanged(value);
                      },
                    ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Divider(
              height: 1,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
