import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewContactScreen extends StatefulWidget {
  @override
  _AddNewContactScreenState createState() => _AddNewContactScreenState();
}

class _AddNewContactScreenState extends State<AddNewContactScreen> {
  TextEditingController edtNameController, edtEmailController;

  @override
  void initState() {
    super.initState();
    edtNameController = TextEditingController();
    edtEmailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Add New Contact',
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
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF404040),
                fontFamily: 'SourceSansPro',
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30, top: 40),
        child: Column(
          children: <Widget>[
            AddContactTextField(
              controller: edtNameController,
              titleText: 'Name',
            ),
            AddContactTextField(
              controller: edtEmailController,
              titleText: 'Email',
            )
          ],
        ),
      ),
    );
  }
}

class AddContactTextField extends StatelessWidget {
  const AddContactTextField({
    Key key,
    @required this.controller,
    this.titleText,
  }) : super(key: key);

  final TextEditingController controller;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            titleText,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF404040),
              fontFamily: 'SourceSansPro',
            ),
          ),
          TextField(
            controller: controller,
          )
        ],
      ),
    );
  }
}
