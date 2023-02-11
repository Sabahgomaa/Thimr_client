import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/widgets/button.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../models/finished_data.dart';

class ItemFinishedOrder extends StatelessWidget {
  final FinishedOrder finishedOrder;

  ItemFinishedOrder({Key? key, required this.finishedOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ;
    return Container(
      width: 342.w,
      height: 110.h,
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'طلب# ${finishedOrder.id}',
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      finishedOrder.date,
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 14.sp,
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: CustomButton(
                    pressed: () {},
                    width: 100.w,
                    height: 28.h,
                    radius: 5.r,
                    text: 'بإنتظار الموافقة',
                    fontSize: 10.sp,
                    buttonColor: AppColors.greyLite.withOpacity(.2),
                    textColor: AppColors.green,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.r, top: 5.r),
              child: Divider(
                height: 0.h,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                        3,
                            (index) => finishedOrder.products[index] == 3
                            ? Padding(
                          padding: EdgeInsets.all(2.r),
                          child: Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                                color: AppColors.whiteApp,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Text(
                                  '+${finishedOrder.products.length - 3}',
                                  style: TextStyle(
                                    color: AppColors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        )
                            : Padding(
                          padding: EdgeInsets.all(2.r),
                          child: Container(
                              width: 25.w,
                              height: 25.h,
                              child: Image.network(
                                  finishedOrder.products[index].url)),
                        )),
                  ),
                  Text(
                    finishedOrder.orderPrice.toString() + LocaleKeys.rial.tr(),
                    style: TextStyle(
                        color: AppColors.green,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
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
