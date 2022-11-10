import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/button.dart';
import 'package:thimar_client/shared/widgets/input_without_image.dart';

class SuggestionsAndComplaints extends StatelessWidget {
  const SuggestionsAndComplaints({Key? key}) : super(key: key);

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
            'الأقتراحات والشكاوي',
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
          padding:  EdgeInsets.all(8.r),
          child: Container(
            height: 400.h,
            child: Column(
              children: [
                InputWithoutImage(
                  hint: 'الإسم',
                ),
                SizedBox(height: 5.h,),
                InputWithoutImage(
                  hint: 'رقم الموبايل',
                ),
                SizedBox(height: 5.h,),
                Padding(
                  padding: EdgeInsets.only(top: 5.r,bottom: 5.r),
                  child: InputWithoutImage(
                    hint: 'الموضوع',
                  ),
                ),
                SizedBox(height: 5.h,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomeButton(
                      text: 'إرسال',
                      fontSize: 15.sp,
                      textColor: AppColors.whiteApp,
                      pressed: () {},
                      width: 312.w,
                      height: 54.h),
                )
              ],
            ),
          ),
        ),
    );
  }
}
