import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/material.dart';

class SeeStoryScreen extends StatefulWidget {
  @override
  _SeeStoryScreenState createState() => _SeeStoryScreenState();
}

class _SeeStoryScreenState extends State<SeeStoryScreen> {
  TextEditingController edtCommentController;

  @override
  void initState() {
    super.initState();
    edtCommentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('images/image_background.png'),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 44, left: 20, right: 20),
              child: Row(
                children: <Widget>[
                  TextSourceSansPro(
                    title: 'Binty Jali',
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  Spacer(),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    constraints: BoxConstraints(minHeight: 48),
                    margin: EdgeInsets.only(bottom: 5, left: 16, right: 16),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage:
                                AssetImage('images/simple_avatar.png'),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextSourceSansPro(
                              title: 'Sadia',
                              fontSize: 12,
                              color: Color(0xFF299DCA),
                            ),
                            TextSourceSansPro(
                              title: 'Just awesome !!!!',
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30, right: 16, left: 16, top: 10),
              height: 48,
              constraints: BoxConstraints(minWidth: 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: Color.fromRGBO(84, 85, 80, 1),
                      ),
                      child: Center(
                        child: TextField(
                          controller: edtCommentController,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.white54,
                                fontFamily: 'SourceSansPro',
                                fontSize: 13,
                              ),
                              border: InputBorder.none,
                              hintText: 'Write your comment'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    child: FloatingActionButton(
                      backgroundColor: Color(0xFF1ACCB4),
                      onPressed: () {},
                      child: ImageIcon(
                        AssetImage('images/sent_message.png'),
                      ),
                    ),
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
