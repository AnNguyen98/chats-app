import 'package:chats_app/widgets/nav_bar_profile_item.dart';
import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/material.dart';

class StorageScreen extends StatefulWidget {
  @override
  _StorageScreenState createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            NavBarProfileItem(
              titleText: 'Storage',
              onPressedLeading: () {
                Navigator.pop(context);
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      TextSourceSansPro(
                        title: 'Internal Storage',
                        color: Color(0xFF404040),
                        fontSize: 14,
                      ),
                      Spacer(),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {},
                        child: TextSourceSansPro(
                          title: 'Change',
                          color: Color(0xFF2A99CC),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  TextSourceSansPro(
                    title: '768 MB of 8.00 GB',
                    color: Color(0xFFA3A3A3),
                    fontSize: 14,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LinearProgressIndicator(
                    backgroundColor: Colors.green,
                    value: 0.5,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
