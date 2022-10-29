import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/widgets/button.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                    )
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
    );
  }
}
