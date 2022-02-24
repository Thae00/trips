import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {

  final double size;
  final String text;
   final Color color ;
  AppLargeText(this.size, this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
