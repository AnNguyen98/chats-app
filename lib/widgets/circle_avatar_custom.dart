import 'package:flutter/material.dart';

class CircleAvatarCustom extends StatelessWidget {
  const CircleAvatarCustom({
    this.image,
    this.radius,
    this.backgroundColor = Colors.greenAccent,
    Key key,
    this.onTabUserImage,
  }) : super(key: key);

  final ImageProvider image;
  final double radius;
  final Color backgroundColor;
  final Function onTabUserImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color: Colors.grey.withOpacity(0.7),
        ),
      ),
      child: GestureDetector(
        onTap: onTabUserImage,
        child: CircleAvatar(
          radius: radius,
          backgroundImage: image,
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: backgroundColor,
              radius: 7,
            ),
          ),
        ),
      ),
    );
  }
}
