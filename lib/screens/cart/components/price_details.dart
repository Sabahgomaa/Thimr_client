import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/locale_keys.g.dart';
import '../../../shared/const/colors.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342.5.w,
      height: 160.h,
      decoration: BoxDecoration(
        color: AppColors.whiteApp,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.totalProducts.tr(),
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 15.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '180' + LocaleKeys.rial.tr(),
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 15.sp,
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
                  LocaleKeys.sale.tr(),
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 15.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '40' + LocaleKeys.rial.tr(),
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 15.sp,
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
                  LocaleKeys.total.tr(),
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 15.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '220' + LocaleKeys.rial.tr(),
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 15.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
