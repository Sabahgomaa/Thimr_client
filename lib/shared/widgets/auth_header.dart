import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../const/colors.dart';

class AuthHeader extends StatelessWidget {
  final String title, subTitle, phoneNumber;
  final bool isThirdLine;

  const AuthHeader({
    Key? key,
    required this.title,
    required this.subTitle,
    this.isThirdLine = false,
    this.phoneNumber = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 50.h,
      ),
      Container(
        width: 129.w,
        height: 125.h,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.logoApp.path),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsetsDirectional.only(start: 20.w),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.green,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Padding(
        padding: EdgeInsetsDirectional.only(start: 20.w, bottom: 20.h),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            subTitle,
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
      if (isThirdLine)
        const SizedBox(
          width: 8,
        ),
      if (isThirdLine)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              phoneNumber,
              style: TextStyle(
                color: AppColors.green,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'تغيير رقم الجوال',
                style: TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ],
        )
    ]);
  }
}
