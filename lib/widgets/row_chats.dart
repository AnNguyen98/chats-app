import 'package:chats_app/widgets/circle_avatar_custom.dart';
import 'package:flutter/material.dart';

class RowChats extends StatelessWidget {
  const RowChats({
    this.imageName,
    this.isActive,
    this.userName,
    this.timeText,
    this.lastOfTextChats,
    this.onPressed,
    this.onTabUserImage,
    Key key,
  }) : super(key: key);
  final String imageName, userName, timeText, lastOfTextChats;
  final bool isActive;
  final Function onPressed, onTabUserImage;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 66,
      child: Row(
        children: <Widget>[
          CircleAvatarCustom(
            onTabUserImage: onTabUserImage,
            image: AssetImage(imageName),
            radius: 25,
            backgroundColor: isActive ? Colors.grey : Colors.greenAccent,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF26A6C6),
                          fontFamily: 'SourceSansPro',
                        ),
                      ),
                      Spacer(),
                      Text(
                        timeText,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF97A1A4),
                          fontFamily: 'SourceSansPro',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    lastOfTextChats,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF797979),
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
