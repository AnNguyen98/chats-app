import 'package:chats_app/widgets/navigation_bar_custom.dart';
import 'package:chats_app/widgets/story_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActiveScreen extends StatefulWidget {
  @override
  _ActiveScreenState createState() => _ActiveScreenState();
}

class _ActiveScreenState extends State<ActiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 140,
              child: Stack(
                children: <Widget>[
                  NavigationBarCustom(titleText: 'Active'),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        CupertinoIcons.back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
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
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
