// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/components/summary_order_details.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/button.dart';

class DetailsOrder extends StatelessWidget {
  bool isCurrent;

  DetailsOrder({Key? key, required this.isCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            MagicRouter.pop();
          },
          child: Image.asset(
            Assets.images.back.path,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'تفاصيل الطلب',
          style: TextStyle(
              color: AppColors.green,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 342.w,
                height: 110.h,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'طلب #4587',
                                  style: TextStyle(
                                    color: AppColors.green,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '27,يونيو,2021',
                                  style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 14.sp,
                                  ),
                                )
                              ],
                            ),
                            CustomeButton(
                              pressed: () {},
                              width: 95.w,
                              height: 23.h,
                              radius: 5,
                              text: 'بإنتظار الموافقة',
                              fontSize: 11.sp,
                              buttonColor: AppColors.greyLite.withOpacity(.5),
                              textColor: AppColors.green,
                            ),
                          ],
                        ),
                        // Divider(color: AppColors.grey,height: 0),
                        Row(
                          children: [
                            Text(
                              '180ر.س',
                              style: TextStyle(
                                color: AppColors.green,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8.0,
                right: 20,
                top: 8,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  'عنوان التوصيل',
                  style: TextStyle(
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 343.w,
                height: 100.h,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'المنزل',
                              style: TextStyle(
                                color: AppColors.green,
                                fontSize: 15.sp,
                              ),
                            ),
                            Text(
                              'شقة 40',
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 12.sp,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              'شارع العليا الرياض السعودية',
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          Assets.images.photoProfile.path,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8.0,
                right: 20,
                top: 8,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  'ملخص الطلب',
                  style: TextStyle(
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp),
                ),
              ),
            ),
            SummaryOrderDetails(),
            SizedBox(
              height: 100.h,
            ),
            if (isCurrent == true)
              CustomeButton(
                pressed: () {},
                width: 343.w,
                height: 60.h,
                radius: 5,
                text: 'إلغاء الطلب',
                fontSize: 11.sp,
                buttonColor: AppColors.redLite,
                textColor: AppColors.red,
              ),
            if (isCurrent == false)
              CustomeButton(
                pressed: () {},
                width: 343.w,
                height: 60.h,
                radius: 5,
                text: 'تقييم المنتجات',
                fontSize: 11.sp,
                buttonColor: AppColors.green,
                textColor: AppColors.whiteApp,
              ),
          ],
        ),
      ),
    );
  }
}
