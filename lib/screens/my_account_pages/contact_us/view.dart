import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/button.dart';
import 'package:thimar_client/shared/widgets/input_without_image.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

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
          'تواصل معنا',
          style: TextStyle(
            color: AppColors.green,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            height: 350.h,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Image.asset(Assets.images.mapContactUs.path),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    width: 312.w,
                    height: 122.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(
                                    Assets.images.locationContactUs.path),
                              ),
                              Text(
                                '13 شارع الملك فهد , جدة , المملكة العربية السعودية',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  // color: AppColors.greenLite,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(
                                    Assets.images.callingContactUs.path),
                              ),
                              Text(
                                '+966 054 87452',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(
                                    Assets.images.messageContactUs.path),
                              ),
                              Text(
                                'info@thimar.com',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  // color: AppColors.greenLite,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            'أو يمكنك إرسال رسالة ',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 315.h,
              child: Column(
                children: [
                  InputWithoutImage(
                    hint: 'الإسم',
                  ),
                  InputWithoutImage(
                    hint: 'رقم الموبايل',
                  ),
                  InputWithoutImage(
                    hint: 'الموضوع',
                  ),
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
        ],
      ),
    );
  }
}
