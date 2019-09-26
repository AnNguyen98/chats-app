import 'package:chats_app/widgets/nav_bar_profile_item.dart';
import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/material.dart';

class ApplicationInforScreen extends StatefulWidget {
  @override
  _ApplicationInforScreenState createState() => _ApplicationInforScreenState();
}

class _ApplicationInforScreenState extends State<ApplicationInforScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NavBarProfileItem(
              titleText: 'Infor',
              onPressedLeading: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            RowForInfor(
              title: 'Data Usage',
              inforTitle: '12.29 GB used since 12 Jan 2019',
            ),
            RowForInfor(
              title: 'Permissions',
              inforTitle: 'Camera, Microphone, and Storage',
            ),
            RowForInfor(
              title: 'Battery',
              inforTitle: '24% use since last full charge',
            ),
            RowForInfor(
              title: 'Memory',
              inforTitle: '24% use since last full charge',
            )
          ],
        ),
      ),
    );
  }
}

class RowForInfor extends StatelessWidget {
  const RowForInfor({
    this.inforTitle,
    this.title,
    Key key,
  }) : super(key: key);

  final String title;
  final String inforTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextSourceSansPro(
            title: title,
            fontSize: 14,
            color: Color(0xFF404040),
          ),
          TextSourceSansPro(
            title: inforTitle,
            fontSize: 14,
            color: Color(0xFFA3A3A3),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Divider(
              color: Colors.grey,
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
