import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/button.dart';
import 'package:thimar_client/shared/widgets/input_without_image.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

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
          'الدفع',
          style: TextStyle(
            color: AppColors.green,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              width: 343.w,
              height: 152.16.h,
              child: Image.asset(Assets.images.card1.path)),
          Container(
              width: 343.w,
              height: 152.16.h,
              child: Image.asset(Assets.images.card2.path)),
          Padding(
            padding: EdgeInsets.only(top: 20.r, left: 8.r, right: 8.r),
            child: DottedBorder(
              dashPattern: [4, 5],
              strokeWidth: 1,
              strokeCap: StrokeCap.round,
              borderType: BorderType.RRect,
              color: AppColors.green,
              radius: Radius.circular(10),
              child: CustomeButton(
                pressed: () {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (builder) {
                        return Container(
                          height: 400.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 300.h,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'إضافة بطاقة',
                                      style: TextStyle(
                                        color: AppColors.green,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  InputWithoutImage(
                                    hint: 'اسم صاحب البطاقة',
                                  ),
                                  InputWithoutImage(
                                    hint: 'رقم البطاقة',
                                  ),
                                  Container(
                                    height: 60,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InputWithoutImage(
                                          hint: 'تاريخ الإنتهاء (شهر / سنة)',
                                        ),
                                        InputWithoutImage(
                                          hint: '(Cvv) الرقم السري ',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomeButton(
                                        text: 'إضافة بطاقة',
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
                      });
                },
                width: 370.w,
                height: 54.h,
                fontSize: 15.sp,
                buttonColor: AppColors.greyLite.withOpacity(.2),
                textColor: AppColors.green,
                text: 'إضافة بطاقة',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
