import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/button.dart';
import 'package:thimar_client/shared/widgets/input_without_image.dart';

class RechargeNow extends StatelessWidget {
  const RechargeNow({Key? key}) : super(key: key);

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
          'شحن الان',
          style: TextStyle(
            color: AppColors.green,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: 80.r,
          right: 8.r,
        ),
        child: ListView(
          children: [
            Text(
              'معلومات المبلغ',
              style: TextStyle(
                color: AppColors.green,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InputWithoutImage(hint: 'المبلغ الخاص بك'),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.r,
                right: 8.r,
              ),
              child: Text(
                'معلومات البطاقة',
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InputWithoutImage(hint: 'الاسم'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InputWithoutImage(hint: 'رقم البطاقة الائتمانية'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputWithoutImage(hint: 'تاريخ الانتهاء'),
                  SizedBox(
                    width: 8.w,
                  ),
                  InputWithoutImage(hint: 'الرقم المتسلسل'),
                ],
              ),
            ),
            SizedBox(height: 70.h,),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
                child: CustomeButton(
              pressed: () {},
              width: 343.w,
              height: 60.h,
              text: 'دفع',
              fontSize: 15.sp,
            ))
          ],
        ),
      ),
    );
  }
}
