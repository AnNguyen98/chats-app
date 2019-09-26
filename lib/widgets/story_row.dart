import 'package:chats_app/screens/call_screen.dart';
import 'package:chats_app/widgets/circle_avatar_custom.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StoryRow extends StatelessWidget {
  const StoryRow({
    this.image,
    this.nameText,
    this.timePostRecent,
    this.callOnPressed,
    this.messageOnPressed,
    this.onPressed,
    Key key,
  }) : super(key: key);

  final ImageProvider image;
  final String nameText;
  final String timePostRecent;
  final Function callOnPressed;
  final Function messageOnPressed;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 71,
        child: Row(
          children: <Widget>[
            CircleAvatarCustom(
              image: image,
              radius: 25,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          nameText,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF26A6C6),
                            fontFamily: 'SourceSansPro',
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          timePostRecent,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF797979),
                            fontFamily: 'SourceSansPro',
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //TODO: Calling
                            builder: (context) => CallScreen(),
                          ),
                        );
                      }, //callOnPressed,
                      icon: ImageIcon(
                        AssetImage('images/call_icon.png'),
                        color: Color(0xFF1ACCB4),
                      ),
                    ),
                    IconButton(
                      onPressed: messageOnPressed,
                      icon: Icon(
                        FontAwesomeIcons.comment,
                        color: Color(0xFF1ACCB4),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
