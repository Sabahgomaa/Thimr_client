import 'package:flutter/material.dart';
import '../const/colors.dart';

// ignore: must_be_immutable
class CustomeTextButton extends StatelessWidget {
  Function() function;
  String text;
  double fontSize;
  Color fontcolor;
  FontWeight? fontWeight;

  CustomeTextButton(
      {Key? key,
      required this.text,
      required this.function,
      required this.fontSize,
      this.fontWeight,
      this.fontcolor = AppColors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: fontcolor,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: "Tajawal",

        ),
      ),
    );
  }
}
