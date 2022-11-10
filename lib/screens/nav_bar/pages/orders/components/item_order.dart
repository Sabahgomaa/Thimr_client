import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/widgets/button.dart';

class ItemOrder extends StatelessWidget {
  const ItemOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342.w,
      height: 110.h,
      child: Padding(
        padding:EdgeInsets.all(8.r),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Align(
                  alignment:AlignmentDirectional.topEnd,
                  child: CustomeButton(
                    pressed: () {},
                    width: 100.w,
                    height: 28.h,
                    radius: 5,
                    text: 'بإنتظار الموافقة',
                    fontSize: 10.sp,
                    buttonColor: AppColors.greyLite.withOpacity(.2),
                    textColor: AppColors.green,
                  ),
                )
              ],
            ),
             Padding(
               padding: EdgeInsets.only(bottom:5.r,top: 5.r),
               child: Divider(height: 0.h,),
             ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                        3,
                        (index) => index == 3
                            ? SizedBox.shrink()
                            : Container(
                                width: 25.w,
                                height: 25.h,
                                child: Image.asset(
                                    Assets.images.department.path))),
                  ),
                  Text(
                    '180ر.س',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 15.sp,
                    ),
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
