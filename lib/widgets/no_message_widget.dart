import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoMessageWidget extends StatelessWidget {
  const NoMessageWidget({
    this.addNewMessagePressed,
    Key key,
  }) : super(key: key);

  final Function addNewMessagePressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.comments,
                  size: 50,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'No messages in your inbox.Break the ice send the first message',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF454545),
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: Color(0xFF299BCB),
              onPressed: addNewMessagePressed,
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
