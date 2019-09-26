import 'package:flutter/material.dart';

class TextSourceSansPro extends StatelessWidget {
  const TextSourceSansPro({
    this.title,
    this.color,
    this.fontSize,
    this.textAlign = TextAlign.left,
    Key key,
  }) : super(key: key);

  final String title;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.visible,
      maxLines: 10,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: 'SourceSansPro',
      ),
    );
  }
}
