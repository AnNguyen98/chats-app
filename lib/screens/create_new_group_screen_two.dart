import 'package:chats_app/screens/create_new_group_screen_three.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNewGroupScreenTwo extends StatefulWidget {
  @override
  _CreateNewGroupScreenTwoState createState() =>
      _CreateNewGroupScreenTwoState();
}

class _CreateNewGroupScreenTwoState extends State<CreateNewGroupScreenTwo> {
  TextEditingController edtGroupNameController;

  @override
  void initState() {
    super.initState();
    edtGroupNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Create New Group',
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
            CupertinoIcons.back,
            color: Colors.grey,
          ),
        ),
        actions: <Widget>[
          AbsorbPointer(
            //TODO: absorbing = true - > Enable Button
            absorbing: false,
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateNewGroupScreenThree(),
                  ),
                );
              },
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueAccent,
                  fontFamily: 'SourceSansPro',
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 25, bottom: 65),
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Color(0xFF888F9D),
                    onPressed: () {},
                    child: Icon(Icons.camera_alt),
                  ),
                  Text(
                    'Upload',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF909090),
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 66,
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Group Name',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF909090),
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                  TextField(
                    controller: edtGroupNameController,
                  )
                ],
              ),
            ),
            Container(
              height: 130,
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Participants: 5',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF909090),
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 58,
                          height: 82,
                          margin: EdgeInsets.only(right: 8),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Color(0xFF2299BCB),
                                radius: 25,
                                backgroundImage:
                                    AssetImage('images/simple_avatar.png'),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Text(
                                  'Marry jane',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF797979),
                                    fontFamily: 'SourceSansPro',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: MaterialButton(
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                          style: BorderStyle.solid,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        'Add Participants',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF404040),
                          fontFamily: 'SourceSansPro',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
