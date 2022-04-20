import 'package:flutter/material.dart';

void pushAndFinish(
  BuildContext context,
  Widget screen,
) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: screen,
      ),
    ),
    (route) => false,
  );
}

void push(
  BuildContext context,
  Widget screen,
) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: screen,
      );
    }),
  );
}
