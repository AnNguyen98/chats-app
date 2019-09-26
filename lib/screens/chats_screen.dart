import 'package:chats_app/screens/chat_content_screen.dart';
import 'package:chats_app/screens/friend_profile_screen.dart';
import 'package:chats_app/screens/message_request_screen.dart';
import 'package:chats_app/screens/new_chat_screen.dart';
import 'package:chats_app/widgets/circle_avatar_custom.dart';
import 'package:chats_app/widgets/no_message_widget.dart';
import 'package:chats_app/widgets/row_chats.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<String> messages = [''];
  List<String> messageRequests = [''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: messages.length == 0
          ? NoMessageWidget(
              addNewMessagePressed: () {},
            )
          : Container(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: 66,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewChatScreen(),
                            ),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Color(0xFF2299BCB),
                              radius: 25,
                              child: Icon(
                                FontAwesomeIcons.userPlus,
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '+New chat or create group',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF797979),
                                fontFamily: 'SourceSansPro',
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  } else if (messageRequests.length > 0 && index == 1) {
                    return Container(
                      height: 66,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MessageRequestScreen(),
                            ),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Color(0xFF2299BCB),
                              radius: 25,
                              child: Icon(
                                FontAwesomeIcons.commentDots,
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Message Requests',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF404040),
                                fontFamily: 'SourceSansPro',
                              ),
                            ),
                            Spacer(),
                            CircleAvatar(
                              backgroundColor: Color(0xFF299BCB),
                              radius: 8,
                              child: Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return RowChats(
                      onTabUserImage: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FriendProfileScreen(),
                          ),
                        );
                      },
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatContentScreen(),
                          ),
                        );
                      },
                      imageName: 'images/simple_avatar.png',
                      isActive: index.isOdd,
                      userName: 'Marry jane',
                      timeText: '10:43 PM',
                      lastOfTextChats: 'Yeah. that\'s what I\'m saying',
                    );
                  }
                },
              ),
            ),
    );
  }
}
