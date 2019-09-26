import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:flutter/material.dart';

class AlertDialogRate extends StatefulWidget {
  AlertDialogRate({this.onSubmit});

  final Function onSubmit;

  @override
  _AlertDialogRateState createState() => _AlertDialogRateState();
}

class _AlertDialogRateState extends State<AlertDialogRate> {
  int numberOfRate = 0;

  List<Color> colorStartRate = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];

  String titleRate = '';

  _numberOfRate(int index) {
    numberOfRate = index + 1;
    for (int i = 0; i < colorStartRate.length; i++) {
      if (i <= index) {
        colorStartRate[i] = Colors.yellow;
      } else {
        colorStartRate[i] = Colors.grey;
      }
    }
    switch (numberOfRate) {
      case 1:
        titleRate = 'Poor';
        break;
      case 2:
        titleRate = 'Fair';
        break;
      case 3:
        titleRate = 'Good';
        break;
      case 5:
        titleRate = 'Excellent';
        break;
      default:
        titleRate = 'Very Good';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: TextSourceSansPro(
        title: 'Please rate the quality \nof your call',
        fontSize: 18,
        color: Color(
          0xFF4D4D4D,
        ),
        textAlign: TextAlign.center,
      ),
      content: Container(
        height: 70,
        child: Column(
          children: <Widget>[
            Row(
              children: [0, 1, 2, 3, 4].map<Widget>((index) {
                return IconButton(
                  color: colorStartRate[index],
                  icon: Icon(Icons.star),
                  onPressed: () {
                    setState(() {
                      _numberOfRate(index);
                    });
                  },
                );
              }).toList(),
            ),
            TextSourceSansPro(
              title: titleRate,
              fontSize: 12,
              color: Color(
                0xFF4D4D4D,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: TextSourceSansPro(
            title: 'Not Now',
            fontSize: 12,
            color: Color(
              0xFF2A99CC,
            ),
          ),
        ),
        AbsorbPointer(
          absorbing: numberOfRate == 0,
          child: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              widget.onSubmit(numberOfRate);
            },
            child: TextSourceSansPro(
              title: 'Submit',
              fontSize: 12,
              color: numberOfRate == 0
                  ? Color(
                      0xFFC1C1C1,
                    )
                  : Color(
                      0xFF2A99CC,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
