import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/shared/widgets/loading_progress.dart';

import '../const/colors.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double fontSize;
  final double? height;
  final double radius;
  final String text;
  final Function() pressed;
  final bool? isUpperCase;
  final Color? textColor;
  final Color? buttonColor;
  final Color? borderColor;
  final TextDecoration? decoration;
  final TextDirection? textDirection;
  final String? fontFamily;
  final bool isLoading;
  final DecorationImage? image;

  CustomButton(
      {this.text = '',
      required this.pressed,
      this.isUpperCase,
      this.buttonColor = AppColors.green,
      this.textColor = Colors.white,
      this.decoration,
      this.width,
      this.height,
      this.radius = 10,
      this.fontFamily,
      this.textDirection,
      this.fontSize = 20,
      this.isLoading = false,
      this.borderColor = AppColors.whiteApp,
      this.image});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: Container(
                width: width ?? 343.w,
                height: height ?? 60.h,
                child: LoadingProgress()),
          )
        : Stack(children: [
            Container(
              width: width ?? 343.w,
              height: height ?? 60.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: buttonColor,
                  border: Border.all(color: borderColor!)),
              child: MaterialButton(
                onPressed: pressed,
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      decoration: decoration,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ]);
  }
}
