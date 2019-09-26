import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class ChatContentScreen extends StatefulWidget {
  @override
  _ChatContentScreenState createState() => _ChatContentScreenState();
}

class _ChatContentScreenState extends State<ChatContentScreen> {
  List<String> messages = [
    'The troubling thing is, there are maybe a tenfold or even a hundredfold of stories inconsistent to theirs.',
    '''The troubling thing is, there are maybe a tenfold or even a hundredfold of stories inconsistent 
         to theirs. there are maybe a tenfold or 
         even a hundredfold of stories inconsistent to theirs.there are maybe a tenfold or even a 
         hundredfold of stories inconsistent to theirs.''',
    'Many people sign up for affiliate programs with the hopes of making some serious money.',
    'There are numerous success stories you will hear about businesses making it good on the internet.',
    'There are numerous success ',
    'Many people sign up for affiliate programs with the hopes of making some serious money.',
  ];

  TextEditingController _messageController;
  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messageController = TextEditingController();
    _scrollController = ScrollController();
    KeyboardVisibilityNotification().addNewListener(onChange: (bool visible) {
      if (visible) {
        setScrollListView(300);
      } else {
        setScrollListView(-100);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setScrollListView(100);
    });
  }

  setScrollListView(int position) {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + position,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut);
    }
  }

  addMeaagse(String text) {
    if (text != '') {
      setState(() {
        messages.add(text);
        _messageController.text = '';
        setScrollListView(100);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Color(0xFF858585),
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextSourceSansPro(
              title: 'Jommon Sadik',
              color: Color(0xFF404040),
              fontSize: 14,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                TextSourceSansPro(
                  title: 'Active now',
                  color: Color(0xFFA0A0A0),
                  fontSize: 10,
                ),
              ],
            )
          ],
        ),
        actions: <Widget>[
          CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFFF7F9F8),
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(
                Icons.phone,
                color: Colors.green,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFFF7F9F8),
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(
                Icons.videocam,
                color: Colors.green,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    reverse: false,
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      if (index.isOdd) {
                        return RowMessagesChat(
                          message: messages[index],
                          image: AssetImage('images/simple_avatar.png'),
                        );
                      } else {
                        return RowMessagesChat(
                          isMe: false,
                          message: messages[index],
                          image: AssetImage('images/other_image.png'),
                        );
                      }
                    },
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.grey.withOpacity(0.1),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            focusColor: Colors.black12,
                            color: Colors.grey,
                            onPressed: () {},
                            icon: Icon(Icons.mood),
                          ),
                          IconButton(
                            color: Colors.grey,
                            onPressed: () {},
                            icon: Icon(Icons.camera_alt),
                          ),
                          IconButton(
                            color: Colors.grey,
                            onPressed: () {},
                            icon: Icon(Icons.photo),
                          ),
                          IconButton(
                            color: Colors.grey,
                            onPressed: () {},
                            icon: Icon(Icons.mic),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: TextField(
                                onSubmitted: (text) {
                                  addMeaagse(text);
                                },
                                controller: _messageController,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'SourceSansPro',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Write Message',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFFC1C1C1),
                                    fontFamily: 'SourceSansPro',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              addMeaagse(_messageController.text);
                            },
                            icon: Icon(Icons.send),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RowMessagesChat extends StatelessWidget {
  const RowMessagesChat({
    Key key,
    this.message,
    this.borderRadius,
    this.colorsGradient,
    this.image,
    this.isMe = true,
  }) : super(key: key);

  final String message;
  final BorderRadius borderRadius;
  final List<Color> colorsGradient;
  final ImageProvider image;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          isMe
              ? Container()
              : Container(
                  margin: EdgeInsets.only(right: 5, left: 4),
                  padding: EdgeInsets.only(top: 0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: image,
                  ),
                ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: 24,
                left: isMe ? 30 : 0,
                right: isMe ? 0 : 30,
                bottom: 30,
              ),
              padding: EdgeInsets.only(
                top: 16.5,
                bottom: 16.5,
                right: 16,
                left: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(!isMe ? 20 : 0),
                  bottomLeft: Radius.circular(isMe ? 20 : 0),
                ),
                gradient: LinearGradient(
                  colors: isMe
                      ? [Color(0xFF1ACCB4), Color(0xFF299BCB)]
                      : [
                          Colors.grey.withOpacity(0.5),
                          Colors.grey.withOpacity(0.5),
                        ],
                ),
              ),
              child: TextSourceSansPro(
                fontSize: 14,
                color: Colors.white,
                title: message,
              ),
            ),
          ),
          isMe
              ? Container(
                  margin: EdgeInsets.only(right: 5, left: 4),
                  padding: EdgeInsets.only(top: 0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: image,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
