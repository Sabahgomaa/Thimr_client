import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/button.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            MagicRouter.pop();
          },
          child: Image.asset(Assets.images.back.path),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'الدفع',
          style: TextStyle(
            color: AppColors.green,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              width: 343.w,
              height: 152.16.h,
              child: Image.asset(Assets.images.card1.path)),
          Container(
              width: 343.w,
              height: 152.16.h,
              child: Image.asset(Assets.images.card2.path)),
          Padding(
            padding:  EdgeInsets.only(top: 20.r, left: 8.r, right: 8.r),
            child: DottedBorder(
              dashPattern: [4, 5],
              strokeWidth: 1,
              strokeCap: StrokeCap.round,
              borderType: BorderType.RRect,
              color: AppColors.green,
              radius: Radius.circular(10),
              child: CustomeButton(
                pressed: () {},
                width: 370.w,
                height: 54.h,
                fontSize: 15.sp,
                buttonColor: AppColors.greyLite.withOpacity(.2),
                textColor: AppColors.green,
                text: 'إضافة بطاقة',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
