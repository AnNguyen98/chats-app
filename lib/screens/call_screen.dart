import 'package:chats_app/screens/video_call_screen.dart';
import 'package:chats_app/widgets/alert_dialog_rate_call.dart';
import 'package:chats_app/widgets/button_call_control.dart';
import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  bool isMicOff = true;

  @override
  void initState() {
    super.initState();
  }

  _showRateCallAlert(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialogRate(
          onSubmit: (rateYourCall) {
            print('Rate : $rateYourCall');
          },
        );
      },
    );
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
                    title: 'Nicholas Mason',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ImageIcon(
                    AssetImage('images/call_icon_app.png'),
                    color: Colors.white,
                    size: 34,
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 40, left: 80, right: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ButtonControlCall(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoCallScreen(),
                        ),
                      );
                    },
                    icon: Icons.videocam,
                    iconColor: Color(0xFF1ACCB4),
                  ),
                  ButtonControlCall(
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        isMicOff = !isMicOff;
                      });
                    },
                    icon: isMicOff ? Icons.mic_off : Icons.mic_none,
                    iconColor: Colors.grey,
                  ),
                  ButtonControlCall(
                    color: Color(0xFFF53333),
                    onPressed: () {
                      _showRateCallAlert(context);
                    },
                    icon: Icons.call_end,
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
