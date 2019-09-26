import 'package:chats_app/screens/create_new_group_screen_two.dart';
import 'package:chats_app/widgets/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNewGroupScreenOne extends StatefulWidget {
  @override
  _CreateNewGroupScreenOneState createState() =>
      _CreateNewGroupScreenOneState();
}

class _CreateNewGroupScreenOneState extends State<CreateNewGroupScreenOne> {
  TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
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
                    builder: (context) => CreateNewGroupScreenTwo(),
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
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                child: SearchWidget(
                  controller: searchController,
                  onChanged: (value) {},
                ),
              );
            } else {
              return Container(
                height: 66,
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xFF2299BCB),
                        radius: 25,
                        backgroundImage: AssetImage('images/simple_avatar.png'),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          'Minhaz Ahmed',
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
              );
            }
          },
        ),
      ),
    );
  }
}
