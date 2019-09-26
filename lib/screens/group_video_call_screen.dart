import 'package:chats_app/widgets/alert_dialog_rate_call.dart';
import 'package:chats_app/widgets/button_call_control.dart';
import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GroupVideoCallScreen extends StatefulWidget {
  @override
  _GroupVideoCallScreenState createState() => _GroupVideoCallScreenState();
}

class _GroupVideoCallScreenState extends State<GroupVideoCallScreen> {
  bool isMicOff = true;
  bool isCamereOff = true;

  List<String> images = [
    'images/image_group_call1.png',
    'images/image_group_call2.png',
    'images/image_group_call3.png',
    'images/image_group_call4.png',
  ];
  double width = 0;
  double height = 0;

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
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.cyan,
        child: Stack(
          children: <Widget>[
            Container(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.5,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: width / 2,
                    height: height / 2,
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage(images[index]),
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(CupertinoIcons.back),
                    iconSize: 25,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextSourceSansPro(
                    title: 'Cousins Adda', //Group name
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    child: ButtonControlCall(
                      icon: CupertinoIcons.switch_camera,
                      color: Color.fromRGBO(46, 59, 63, 0.6),
                      iconColor: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(
                bottom: 116,
                left: 80,
                right: 80,
                top: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ButtonControlCall(
                    color: Color.fromRGBO(119, 87, 82, 1),
                    onPressed: () {
                      setState(() {
                        isCamereOff = !isCamereOff;
                        print(width);
                        print(height);
                      });
                    },
                    icon: isCamereOff ? Icons.videocam_off : Icons.videocam,
                    iconColor: Colors.white,
                  ),
                  ButtonControlCall(
                    color: Color.fromRGBO(119, 87, 82, 1),
                    onPressed: () {},
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
              alignment: Alignment.bottomCenter,
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
