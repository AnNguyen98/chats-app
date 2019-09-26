import 'package:flutter/material.dart';

class ButtonControlCall extends StatelessWidget {
  const ButtonControlCall({
    this.onPressed,
    this.color,
    this.icon,
    this.iconColor,
    Key key,
  }) : super(key: key);

  final Function onPressed;
  final Color color;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
      minWidth: 60,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      onPressed: onPressed,
      child: Icon(
        icon,
        color: iconColor,
        size: 28,
      ),
    );
  }
}
