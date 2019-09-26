import 'package:chats_app/screens/active_screen.dart';
import 'package:chats_app/widgets/circle_avatar_custom.dart';
import 'package:chats_app/widgets/header_collection.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                height: 216,
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: <Widget>[
                    HeaderCollection(
                      titleTextLeft: 'Story',
                      onPressed: () {},
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Container(
                                width: 120,
                                height: 177,
                                margin: EdgeInsets.only(right: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('images/overlay_image.png'),
                                  ),
                                ),
                                child: Center(
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Colors.white.withOpacity(0.6),
                                    radius: 25,
                                    child: IconButton(
                                      iconSize: 25,
                                      icon: Icon(Icons.add_a_photo),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                width: 120,
                                height: 177,
                                margin: EdgeInsets.only(right: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white.withOpacity(0),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('images/simple_avatar.png'),
                                  ),
                                ),
                                child: Opacity(
                                  opacity: 0.5,
                                  child: Image(
                                    image:
                                        AssetImage('images/overlay_image.png'),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (index == 1) {
              return Container(
                height: 122,
                child: Column(
                  children: <Widget>[
                    HeaderCollection(
                      titleTextLeft: 'Active',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ActiveScreen(),
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 58,
                              margin: EdgeInsets.only(right: 16),
                              child: Column(
                                children: <Widget>[
                                  CircleAvatarCustom(
                                    image:
                                        AssetImage('images/simple_avatar.png'),
                                    radius: 27,
                                  ),
                                  Text(
                                    'Jabed',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF404040),
                                      fontFamily: 'SourceSansPro',
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (index == 2) {
              return HeaderCollection(
                titleTextLeft: 'Recent chats',
                onPressed: () {},
              );
            } else {
              return Container(
                height: 71,
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      CircleAvatarCustom(
                        image: AssetImage('images/simple_avatar.png'),
                        radius: 25,
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
                                    'Marry jane',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF26A6C6),
                                      fontFamily: 'SourceSansPro',
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '10:43 PM',
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
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Yeah. that\'s what I\'m saying',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF797979),
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
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
