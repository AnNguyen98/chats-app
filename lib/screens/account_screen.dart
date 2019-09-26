import 'package:chats_app/widgets/nav_bar_profile_item.dart';
import 'package:chats_app/widgets/row_for_item_profile.dart';
import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            NavBarProfileItem(
              titleText: 'Account',
              onPressedLeading: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            RowForItemProfile(
              title: 'Privacy Policy',
              onPressed: () {},
            ),
            RowForItemProfile(
              title: 'Application Security',
              onPressed: () {},
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      TextSourceSansPro(
                        title: 'Name',
                        fontSize: 14,
                        color: Color(0xFF404040),
                      ),
                      Spacer(),
                      MaterialButton(
                        onPressed: () {},
                        child: TextSourceSansPro(
                          title: 'Edit',
                          fontSize: 14,
                          color: Color(0xFF2A99CC),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    child: TextField(
                      enabled: false,
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Franklin Figueroa',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, right: 16),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      TextSourceSansPro(
                        title: 'Change Number',
                        fontSize: 14,
                        color: Color(0xFF404040),
                      ),
                      Spacer(),
                      MaterialButton(
                        onPressed: () {},
                        child: TextSourceSansPro(
                          title: 'Edit',
                          fontSize: 14,
                          color: Color(0xFF2A99CC),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    child: TextField(
                      enabled: false,
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: '669-381-1494',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, right: 16),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {},
                    child: TextSourceSansPro(
                      title: 'Delete Number',
                      fontSize: 14,
                      color: Color(0xFFEC5F67),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, right: 16, left: 16),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
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
