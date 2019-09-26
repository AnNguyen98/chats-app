import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    this.controller,
    this.onChanged,
    Key key,
  }) : super(key: key);

  final TextEditingController controller;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF979797).withOpacity(0.4),
      ),
      margin: EdgeInsets.only(top: 25, left: 16, right: 16),
      child: TextField(
        controller: controller,
        onChanged: (textChange) {
          onChanged(textChange);
        },
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'SourceSansPro',
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white54,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.white54,
            fontSize: 16,
            fontFamily: 'SourceSansPro',
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
