import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../const/colors.dart';

class HaveAccountOrNot extends StatelessWidget {
  final String title;
  final String actionTitle;
  final Function presses;

  const HaveAccountOrNot(
      {Key? key,
      required this.title,
      required this.actionTitle,
      required this.presses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.green,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            actionTitle,
            style: TextStyle(
              color: AppColors.green,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
        ),
      ],
    );
  }
}
