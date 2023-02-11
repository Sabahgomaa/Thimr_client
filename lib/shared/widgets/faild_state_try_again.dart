
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/shared/const/colors.dart';
import '/../gen/fonts.gen.dart';
import '/../generated/locale_keys.g.dart';

class FailedStateTryAgain extends StatelessWidget {
  final VoidCallback? onPress;
  final String? msg;

  const FailedStateTryAgain({Key? key, @required this.onPress,@required this.msg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100.h,
          ),
          Text(
            msg!,
            style: TextStyle(
              color: Colors.black,
              fontFamily: FontFamily.bold,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          GestureDetector(
            onTap: onPress,
            child: Container(
              height: 40.h,
              width: 130.w,
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  LocaleKeys.tryAgain.tr(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: FontFamily.regular,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
        ],
      ),
    );
  }
}