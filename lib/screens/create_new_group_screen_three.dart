import 'package:chats_app/widgets/header_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNewGroupScreenThree extends StatefulWidget {
  @override
  _CreateNewGroupScreenThreeState createState() =>
      _CreateNewGroupScreenThreeState();
}

class _CreateNewGroupScreenThreeState extends State<CreateNewGroupScreenThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: 259,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/image_group_details.png'),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            CupertinoIcons.back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Group Details',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'SourceSansPro',
                            ),
                          ),
                        ),
                      ),
                      AbsorbPointer(
                        //TODO: absorbing = true - > Enable Button
                        absorbing: false,
                        child: MaterialButton(
                          minWidth: 50,
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       //builder: (context) => CreateNewGroupScreenThree(),
                            //       ),
                            // );
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'SourceSansPro',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.all(24),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Travel Guide',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontFamily: 'SourceSansPro',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 110,
              margin: EdgeInsets.only(left: 24, right: 24, top: 20),
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
            ),
            Container(
              height: 122,
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  HeaderCollection(
                    titleTextLeft: 'Shared Content',
                    onPressed: () {},
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
                            margin: EdgeInsets.only(right: 8),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 84,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'images/simple_avatar.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              minWidth: 40,
              child: Text(
                'Delete all chat ',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF9A9A9A),
                  fontFamily: 'SourceSansPro',
                ),
              ),
              onPressed: () {},
            ),
            MaterialButton(
              minWidth: 40,
              child: Text(
                'Leave From Group',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFFEC5F67),
                  fontFamily: 'SourceSansPro',
                ),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
