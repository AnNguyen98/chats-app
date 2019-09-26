import 'package:chats_app/helper.dart';
import 'package:chats_app/models/profile_item.dart';
import 'package:chats_app/screens/account_screen.dart';
import 'package:chats_app/screens/help_screen.dart';
import 'package:chats_app/screens/notification_screen.dart';
import 'package:chats_app/screens/setting_chats_screen.dart';
import 'package:chats_app/screens/storage_screen.dart';
import 'package:chats_app/screens/user_infor_screen.dart';
import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  static String title = 'Profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<ProfileItem> profileItems = [
    ProfileItem(
      icon: Icons.person,
      itemName: 'Account',
      screen: AccountScreen(),
      color: Color(
        0xFF59C1FF,
      ),
    ),
    ProfileItem(
      icon: FontAwesomeIcons.comment,
      itemName: 'Chats',
      screen: SettingChatsScreen(),
      color: Color(
        0xFFFF997B,
      ),
    ),
    ProfileItem(
      icon: Icons.cloud_queue,
      itemName: 'Storage',
      screen: StorageScreen(),
      color: Color(0xFF8AAFFF),
    ),
    ProfileItem(
      icon: Icons.notifications,
      itemName: 'Notification',
      screen: NotificarionScreen(),
      color: Color(0xFFFFB470),
    ),
    ProfileItem(
      icon: Icons.info,
      itemName: 'Application Info',
      screen: ApplicationInforScreen(),
      color: Color(0xFFFD7CFF),
    ),
    ProfileItem(
      icon: Icons.help,
      itemName: 'Help Center',
      screen: HelperScreen(),
      color: Color(0xFF24D4B8),
    ),
    ProfileItem(
      icon: Icons.exit_to_app,
      itemName: 'Logout',
      color: Color(0xFFFF7B7C),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: profileItems.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                height: 124,
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/other_image.png'),
                    ),
                    TextSourceSansPro(
                      title: 'Sahan Priyatin',
                      fontSize: 18,
                      color: Color(0xFF404040),
                    ),
                    TextSourceSansPro(
                      title: 'West Adela',
                      fontSize: 14,
                      color: Color(0xFFBEBEBE),
                    )
                  ],
                ),
              );
            } else {
              ProfileItem item = profileItems[index - 1];
              return MaterialButton(
                onPressed: () {
                  if (item.itemName == 'Logout') {
                    Helper().signOut(context);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => item.screen),
                    );
                  }
                },
                child: Container(
                  height: 45,
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            item.icon,
                            color: item.color,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          TextSourceSansPro(
                            title: item.itemName,
                            fontSize: 14,
                            color: Color(0xFF404040),
                          ),
                          Spacer(),
                          Icon(Icons.navigate_next)
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Divider(
                          height: 1,
                          color: Colors.grey,
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
