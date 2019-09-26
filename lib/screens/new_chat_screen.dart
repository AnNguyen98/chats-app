import 'package:chats_app/screens/add_new_contact_screen.dart';
import 'package:chats_app/screens/create_new_group_screen_one.dart';
import 'package:chats_app/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewChatScreen extends StatefulWidget {
  @override
  _NewChatScreenState createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
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
          'Start a New Chat',
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
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            if (index == 0) {
              return SearchWidget(
                controller: searchController,
                onChanged: (value) {},
              );
            } else if (index == 1) {
              return Container(
                margin: EdgeInsets.only(top: 20),
                child: NewChat(
                  titleText: '+ Add New Contact',
                  icon: FontAwesomeIcons.userPlus,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddNewContactScreen(),
                      ),
                    );
                  },
                ),
              );
            } else if (index == 2) {
              return NewChat(
                titleText: '+ Create Group',
                icon: FontAwesomeIcons.users,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateNewGroupScreenOne(),
                    ),
                  );
                },
              );
            } else if (index == 3) {
              return Container(
                height: 25,
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Your contact',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF343434),
                    fontFamily: 'SourceSansPro',
                  ),
                ),
              );
            } else {
              return Container(
                height: 66,
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
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

class NewChat extends StatelessWidget {
  const NewChat({
    this.titleText,
    this.icon,
    this.onPressed,
    Key key,
  }) : super(key: key);

  final String titleText;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      child: MaterialButton(
        onPressed: onPressed,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Color(0xFF2299BCB),
                  radius: 25,
                  child: Icon(
                    icon,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  titleText,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF404040),
                    fontFamily: 'SourceSansPro',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
