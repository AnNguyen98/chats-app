import 'package:chats_app/widgets/button_call_control.dart';
import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/material.dart';

class ComingCallRecieveScreen extends StatefulWidget {
  @override
  _ComingCallRecieveScreenState createState() =>
      _ComingCallRecieveScreenState();
}

class _ComingCallRecieveScreenState extends State<ComingCallRecieveScreen> {
  bool isMicOff = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('images/love_and_chat.png'),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1ACCB4), //.withOpacity(0.5),
              Color(0xFF299BCB), //.withOpacity(0.3),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 178,
              ),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('images/simple_avatar.png'),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextSourceSansPro(
                    title: 'Lily Hughes',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 40, left: 80, right: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ButtonControlCall(
                    color: Color(0xFFF53333),
                    onPressed: () {},
                    icon: Icons.call_end,
                    iconColor: Colors.white,
                  ),
                  ButtonControlCall(
                    color: Color(0xFF4CD964),
                    onPressed: () {},
                    icon: Icons.call,
                    iconColor: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
