import 'package:chats_app/widgets/nav_bar_profile_item.dart';
import 'package:chats_app/widgets/row_for_item_profile.dart';
import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/material.dart';

class SettingChatsScreen extends StatefulWidget {
  @override
  _SettingChatsScreenState createState() => _SettingChatsScreenState();
}

class _SettingChatsScreenState extends State<SettingChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            NavBarProfileItem(
              titleText: 'Chats',
              onPressedLeading: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            RowForItemProfile(
              title: 'Language',
              onPressed: () {},
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextSourceSansPro(
                    title: 'Customize your chat',
                    fontSize: 14,
                    color: Color(0xFF404040),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      ColorSelectedChat(
                        color: Colors.red,
                        isSelected: true,
                        onPreesed: () {},
                      ),
                      ColorSelectedChat(
                        color: Colors.green,
                        isSelected: false,
                        onPreesed: () {},
                      ),
                      ColorSelectedChat(
                        color: Colors.yellow,
                        isSelected: false,
                        onPreesed: () {},
                      ),
                      ColorSelectedChat(
                        color: Colors.purple,
                        isSelected: false,
                        onPreesed: () {},
                      ),
                      ColorSelectedChat(
                        color: Colors.pink,
                        isSelected: false,
                        onPreesed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 16, left: 16),
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ColorSelectedChat extends StatelessWidget {
  const ColorSelectedChat({
    this.color,
    this.isSelected = false,
    this.onPreesed,
    Key key,
  }) : super(key: key);

  final Color color;
  final Function onPreesed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2,
          color: isSelected ? Colors.grey : Colors.red.withOpacity(0),
        ),
      ),
      child: MaterialButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: onPreesed,
      ),
    );
  }
}
