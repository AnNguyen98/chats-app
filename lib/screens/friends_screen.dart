import 'package:chats_app/widgets/story_row.dart';
import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/material.dart';

class FriendsScreen extends StatefulWidget {
  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            if (index == 0) {
              return HeaderFriends(
                title: 'A',
              );
            } else {
              return StoryRow(
                image: AssetImage('images/simple_avatar.png'),
                nameText: 'Marry jane',
                timePostRecent: '2 menutes ago',
                callOnPressed: () {},
                messageOnPressed: () {},
                onPressed: () {
                  //
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class HeaderFriends extends StatelessWidget {
  const HeaderFriends({
    this.title,
    Key key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextSourceSansPro(
            title: title,
            color: Color(0xFF1CCCB4),
            fontSize: 13,
          ),
          Divider(),
        ],
      ),
    );
  }
}
