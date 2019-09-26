import 'package:chats_app/screens/see_story_screen.dart';
import 'package:chats_app/widgets/story_row.dart';
import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/material.dart';

class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  void _addPhotoStory(context) {
    showModalBottomSheet(
      context: context,
      builder: (bulderContext) {
        return Container(
          height: 207,
          decoration: BoxDecoration(
            color: Colors.red,
            gradient: LinearGradient(
              colors: [
                Color(0xFF299BCB),
                Color(0xFF1ACCB4),
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    TextSourceSansPro(
                      title: 'Recent',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Container(
                height: 76,
                margin: EdgeInsets.only(left: 10),
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          //TODO: Load Image local and choose
                        },
                        child: Image(
                          fit: BoxFit.fitHeight,
                          image: AssetImage('images/simple_avatar.png'),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: TextSourceSansPro(
                    title: 'Cancel',
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                height: 177,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Container(
                        height: 177,
                        width: 120,
                        margin: EdgeInsets.only(right: 8, left: 16),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/simple_avatar.png'),
                          ),
                        ),
                        child: Center(
                          child: FloatingActionButton(
                            onPressed: () {
                              _addPhotoStory(context);
                            },
                            backgroundColor: Color(0xFF9D9D9D).withOpacity(0.4),
                            child: Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        height: 177,
                        width: 120,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/simple_avatar.png'),
                          ),
                        ),
                      );
                    }
                  },
                ),
              );
            } else if (index == 1) {
              return HeaderStory(
                title: 'Recently Updates',
              );
            } else if (index > 1 && index < 5) {
              //5 Length Recently Updates List
              return StoryRow(
                image: AssetImage('images/simple_avatar.png'),
                nameText: 'Marry jane',
                timePostRecent: '2 menutes ago',
                callOnPressed: () {},
                messageOnPressed: () {},
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeeStoryScreen(),
                    ),
                  );
                },
              );
            } else if (index == 5) {
              return HeaderStory(
                title: 'See all',
              );
            } else {
              return StoryRow(
                image: AssetImage('images/simple_avatar.png'),
                nameText: 'Marry jane',
                timePostRecent: '2 menutes ago',
                callOnPressed: () {},
                messageOnPressed: () {},
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeeStoryScreen(),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class HeaderStory extends StatelessWidget {
  const HeaderStory({
    this.title,
    Key key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 16, right: 16),
      child: TextSourceSansPro(
        title: title,
        fontSize: 18,
        color: Color(0xFF343434),
      ),
    );
  }
}
