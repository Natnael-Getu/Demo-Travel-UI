import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  double? width;
  bool isResponsive;
  ResponsiveButton({Key? key, this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('img/button-one.png')),
        ],
      ),
    );
  }
}
