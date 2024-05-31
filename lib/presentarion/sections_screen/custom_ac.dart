// Define the custom widget for the AC label
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

class ACLabel extends StatelessWidget {
final String title;
final Color backgroundColor;
final Color textColor;
final bool isVertical;

ACLabel({
  required this.title,
  this.backgroundColor = Colors.black,
  this.textColor = Colors.white,
  this.isVertical = false,
});

@override
Widget build(BuildContext context) {
  return Container(
    padding: getPadding(
      left: 3,right: 2,top: 5,bottom: 5
    ),
    color: backgroundColor,
    child: isVertical
        ? Transform.rotate(
      angle: -3.14 / 2,
      child: Text(
        title,
        style: TextStyle(color: textColor),
        textAlign: TextAlign.center,
      ),
    )
        : Text(
      title,
      style: TextStyle(color: textColor),
      textAlign: TextAlign.center,
    ),
  );
}
}