import 'package:chats_app/screens/chats_screen.dart';
import 'package:chats_app/screens/friends_screen.dart';
import 'package:chats_app/screens/home_screen.dart';
import 'package:chats_app/screens/profile_screen.dart';
import 'package:chats_app/screens/story_screen.dart';
import 'package:chats_app/widgets/navigation_bar_custom.dart';
import 'package:chats_app/widgets/row_chats.dart';
import 'package:chats_app/widgets/search_widget.dart';
import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<Widget> screens = [
    HomeScreen(),
    ChatsScreen(),
    StoryScreen(),
    FriendsScreen(),
    ProfileScreen(),
  ];
  bool _isSearching = false;
  TextEditingController _edtSearchController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    _edtSearchController = TextEditingController();

    //TEst
    final FirebaseAuth _auth = FirebaseAuth.instance;
    print(_auth.currentUser());
  }

  String setTitleNavigationBar(int index) {
    switch (index) {
      case 0:
        return _isSearching ? 'Search' : 'Home';
        break;
      case 1:
        return _isSearching ? 'Search' : 'Chats';
        break;
      case 2:
        return 'Story';
        break;
      case 3:
        return 'Friends';
        break;
      case 4:
        return 'Profile';
        break;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          NavigationBarCustom(
            titleText: setTitleNavigationBar(_tabController.index),
            onPressed: () {
              // showSearch(
              //   context: context,
              //   delegate: CustomSearchDelegate(),
              // );
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  FocusScope.of(context).requestFocus(FocusNode());
                }
              });
            },
            iconAction: _isSearching ? Icons.close : Icons.search,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: _isSearching ? 70 : 0,
            child: Center(
              child: SearchWidget(
                controller: _edtSearchController,
                onChanged: (textChange) {
                  print(textChange);
                },
              ),
            ),
          ),
          Expanded(
            child: _isSearching
                ? Container(
                    margin: EdgeInsets.only(top: 16),
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        if (setTitleNavigationBar(_tabController.index) ==
                            'Home') {
                          return RowSearchForHome(
                            image: 'images/other_image.png',
                            title: 'Minhaz Ahmed',
                            onPressed: () {},
                          );
                        } else {
                          return RowChats(
                            onPressed: () {},
                            imageName: 'images/simple_avatar.png',
                            isActive: index.isOdd,
                            userName: 'Marry jane',
                            timeText: '10:43 PM',
                            lastOfTextChats: 'Yeah. that\'s what I\'m saying',
                          );
                        }
                      },
                    ),
                  )
                : screens[_tabController.index],
          )
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        onTap: (index) {
          setState(() {
            _tabController.index = index;
          });
        },
        labelColor: Color(0xFF299BCB),
        labelStyle: TextStyle(
          fontSize: 13,
        ),
        labelPadding: EdgeInsets.all(5),
        unselectedLabelColor: Colors.grey,
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
        indicatorColor: Colors.red.withOpacity(0),
        tabs: [
          Tab(
            text: 'Home',
            icon: Icon(FontAwesomeIcons.home),
          ),
          Tab(
            text: 'Chats',
            icon: Icon(FontAwesomeIcons.comment),
          ),
          Tab(
            text: 'Story',
            icon: Icon(FontAwesomeIcons.camera),
          ),
          Tab(
            text: 'Friends',
            icon: Icon(FontAwesomeIcons.userFriends),
          ),
          Tab(
            text: 'Profile',
            icon: Icon(FontAwesomeIcons.userAlt),
          ),
        ],
      ),
    );
  }
}

class RowSearchForHome extends StatelessWidget {
  const RowSearchForHome({
    this.image,
    this.title,
    this.onPressed,
    Key key,
  }) : super(key: key);

  final String image;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 66,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  image,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              TextSourceSansPro(
                title: title,
                fontSize: 13,
                color: Color(0xFF404040),
              ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    this.titleLeft,
    this.onPressed,
  });

  final String titleLeft;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(titleLeft),
          Spacer(),
          MaterialButton(
            onPressed: onPressed,
            child: Text('See all'),
          )
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(CupertinoIcons.back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Column();
  }
}
