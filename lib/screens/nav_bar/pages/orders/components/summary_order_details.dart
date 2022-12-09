import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/const/colors.dart';

class SummaryOrderDetails extends StatelessWidget {
  const SummaryOrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342.5.w,
      height: 170.h,
      // color: AppColors.greenLite,
      decoration: BoxDecoration(
        color: AppColors.whiteApp,
        // border: Border.all(color: AppColors.greyLite),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'إجمالي المنتجات',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 15.sp,
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '180ر.س',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 15.sp,
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'سعر التوصيل',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 15.sp,
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '40ر.س',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 15.sp,
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'المجموع',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 15.sp,
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '220ر.س',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 15.sp,
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Divider(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'تم الدفع بواسطة',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 15.sp,
                      // fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(
                    Assets.images.visa.path,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
