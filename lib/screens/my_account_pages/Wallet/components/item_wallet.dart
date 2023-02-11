import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../shared/const/colors.dart';

class ItemPocket extends StatelessWidget {
  const ItemPocket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 18.w,
                      height: 18.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.grey.withOpacity(.2),
                      ),
                      child:
                      Image.asset(Assets.images.payIcon.path),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding:EdgeInsets.all(4.r),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.chargeWallet.tr(),
                            style: TextStyle(
                              color: AppColors.green,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '255'+LocaleKeys.rial.tr(),
                            style: TextStyle(
                              color: AppColors.green,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '27يونيو2021',
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
