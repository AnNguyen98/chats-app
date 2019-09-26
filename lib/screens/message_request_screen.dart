import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageRequestScreen extends StatefulWidget {
  @override
  _MessageRequestScreenState createState() => _MessageRequestScreenState();
}

class _MessageRequestScreenState extends State<MessageRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Message Requests',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF404040),
            fontFamily: 'SourceSansPro',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: Colors.grey,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 25),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              height: 68,
              child: Container(
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('images/simple_avatar.png'),
                        radius: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Marry jane',
                                textAlign: TextAlign.start,
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
                                'Yeah. that\'s what I\'m saying',
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
                      IconButton(
                        color: Colors.greenAccent,
                        onPressed: () {},
                        iconSize: 25,
                        icon: Icon(CupertinoIcons.check_mark_circled),
                      ),
                      IconButton(
                        color: Colors.redAccent,
                        onPressed: () {},
                        iconSize: 25,
                        icon: Icon(CupertinoIcons.clear_circled),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
