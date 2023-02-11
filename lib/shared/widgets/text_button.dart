import 'package:flutter/material.dart';
import '../const/colors.dart';
import 'loading_progress.dart';

class CustomTextButton extends StatelessWidget {
  Function() press;
  String text;
  double fontSize;
  Color fontColor;
  FontWeight? fontWeight;
  final bool isLoading;

  CustomTextButton(
      {Key? key,
      required this.text,
      required this.press,
      required this.fontSize,
      this.fontWeight,
      this.fontColor = AppColors.grey,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: LoadingProgress(),
          )
        : TextButton(
            onPressed: press,
            child: Text(
              text.toUpperCase(),
              style: TextStyle(
                color: fontColor,
                fontWeight: fontWeight,
                fontSize: fontSize,
                fontFamily: "Tajawal",
              ),
            ),
          );
  }
}
