import 'package:flutter/material.dart';

import '../const/colors.dart';

class CustomeButton extends StatelessWidget {
  final double width;
  final double fontSize;
  final double height;
  final double radius;
  final String text;
  final Function() pressed;
  final bool? isUpperCase;
  final Color? textColor;
  final Color? buttonColor;
  final TextDecoration? decoration;
  final TextDirection? textDirection;
  final String? fontFamily;

  CustomeButton(
      {this.text='',
      required this.pressed,
      this.isUpperCase,
      this.buttonColor = AppColors.green,
      this.textColor = Colors.white,
      this.decoration,
      required this.width,
      required this.height,
      this.radius = 10,
      this.fontFamily,
      this.textDirection,
      this.fontSize=1});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: buttonColor,
        ),
        child: MaterialButton(
          onPressed: pressed,
          child: Center(
            child: Text(text,
                style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    decoration: decoration,
                    )),
          ),
        ),
      ),
    ]);
  }
}
