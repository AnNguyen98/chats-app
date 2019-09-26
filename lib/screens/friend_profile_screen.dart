import 'package:chats_app/widgets/button_call_control.dart';
import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FriendProfileScreen extends StatefulWidget {
  @override
  _FriendProfileScreenState createState() => _FriendProfileScreenState();
}

class _FriendProfileScreenState extends State<FriendProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/love_and_chat.png'),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: 481 / 2,
              decoration: BoxDecoration(
                color: Colors.red,
                gradient: LinearGradient(
                    colors: [Color(0xFF299BCB), Color(0xFF1ACCB4)]),
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(100),
                  bottomStart: Radius.circular(100),
                ),
              ),
            ),
            OrientationBuilder(
              builder: (context, orientaion) {
                return ListView(
                  physics: Orientation.portrait == orientaion
                      ? NeverScrollableScrollPhysics()
                      : AlwaysScrollableScrollPhysics(),
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 100),
                            child: Image(
                              width: 343,
                              height: 352,
                              image:
                                  AssetImage('images/image_profile_friend.png'),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              TextSourceSansPro(
                                title: 'Myrtle Flowers',
                                color: Color(0xFF404040),
                                fontSize: 24,
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          TextSourceSansPro(
                            textAlign: TextAlign.left,
                            title: 'Active Now',
                            fontSize: 12,
                            color: Color(0xFF2A99CC),
                          ),
                          TextSourceSansPro(
                            textAlign: TextAlign.left,
                            title: 'North Kianberg',
                            fontSize: 12,
                            color: Color(0xFF797979),
                          ),
                          Row(
                            children: <Widget>[
                              TextSourceSansPro(
                                textAlign: TextAlign.left,
                                title: 'Elsewhere',
                                fontSize: 12,
                                color: Color(0xFF404040),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  FontAwesomeIcons.facebookF,
                                  color: Colors.blue,
                                  size: 15,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  FontAwesomeIcons.instagram,
                                  size: 15,
                                  color: Colors.purple,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.blueAccent,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ButtonControlCall(
                                  onPressed: () {},
                                  iconColor: Colors.white,
                                  color: Color.fromRGBO(29, 192, 185, 1),
                                  icon: FontAwesomeIcons.comment,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                ButtonControlCall(
                                  onPressed: () {},
                                  iconColor: Colors.white,
                                  color: Color.fromRGBO(29, 192, 185, 1),
                                  icon: FontAwesomeIcons.phone,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                ButtonControlCall(
                                  onPressed: () {},
                                  iconColor: Colors.white,
                                  color: Color.fromRGBO(29, 192, 185, 1),
                                  icon: FontAwesomeIcons.camera,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              MaterialButton(
                                onPressed: () {},
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.block,
                                      color: Color(0xFFEC5F67),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    TextSourceSansPro(
                                      fontSize: 14,
                                      color: Color(0xFFEC5F67),
                                      title: 'Block this user',
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              MaterialButton(
                                onPressed: () {},
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.delete,
                                      color: Color(0xFFC4C4C4),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    TextSourceSansPro(
                                      fontSize: 14,
                                      color: Color(0xFFC4C4C4),
                                      title: 'Delete all chat ',
                                    )
                                  ],
                                ),
                              ),
                              Spacer()
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
