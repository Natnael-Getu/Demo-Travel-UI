import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final Color color;
  final String text;

  AppText(
      {Key? key,
      this.color = Colors.black45,
      this.size = 25,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
