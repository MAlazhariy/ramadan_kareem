// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    Key key,
    @required this.title,
    this.isBold = false,
    @required this.onPressed,
    this.color = Colors.pink,
  }) : super(key: key);
  final String title;
  final bool isBold;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        title,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      color: isBold? color : Colors.transparent,
      textColor: isBold? Colors.white : color,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
    );
  }
}
