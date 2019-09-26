import 'package:chats_app/widgets/alert_dialog_rate_call.dart';
import 'package:chats_app/widgets/button_call_control.dart';
import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoCallScreen extends StatefulWidget {
  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool isMicOff = true;
  bool isCamereOff = true;

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
            image: AssetImage('images/image_call_background.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 50,
                left: 16,
              ),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextSourceSansPro(
                        title: 'Chatting with',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      TextSourceSansPro(
                        title: 'Adeline Ballard',
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      TextSourceSansPro(
                        title: '00:13:31',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    child: Column(
                      children: <Widget>[
                        ButtonControlCall(
                          icon: Icons.add,
                          color: Color.fromRGBO(46, 59, 63, 1),
                          iconColor: Colors.white,
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ButtonControlCall(
                          icon: CupertinoIcons.switch_camera,
                          color: Color.fromRGBO(46, 59, 63, 1),
                          iconColor: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(
                left: 16,
              ),
              alignment: Alignment.bottomLeft,
              child: Image(
                width: 122,
                height: 153,
                image: AssetImage('images/other_image.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16, left: 80, right: 80, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ButtonControlCall(
                    color: Color.fromRGBO(119, 87, 82, 1),
                    onPressed: () {
                      setState(() {
                        isCamereOff = !isCamereOff;
                      });
                    },
                    icon: isCamereOff ? Icons.videocam_off : Icons.videocam,
                    iconColor: Colors.white,
                  ),
                  ButtonControlCall(
                    color: Color.fromRGBO(119, 87, 82, 1),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => GroupVideoCallScreen(),
                      //   ),
                      // );
                    },
                    icon: FontAwesomeIcons.comment,
                    iconColor: Colors.white,
                  ),
                  ButtonControlCall(
                    color: Color.fromRGBO(119, 87, 82, 1),
                    onPressed: () {
                      setState(() {
                        isMicOff = !isMicOff;
                      });
                    },
                    icon: isMicOff ? Icons.mic_off : Icons.mic_none,
                    iconColor: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: ButtonControlCall(
                color: Color(0xFFF53333),
                onPressed: () {
                  _showRateCallAlert(context);
                },
                icon: Icons.call_end,
                iconColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
