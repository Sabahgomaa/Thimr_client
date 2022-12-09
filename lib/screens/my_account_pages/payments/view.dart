import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/screens/my_account_pages/components/app_bar.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/widgets/button.dart';
import 'package:thimar_client/shared/widgets/input_without_image.dart';

import '../../../generated/locale_keys.g.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: LocaleKeys.payment.tr(),
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
              radius: Radius.circular(10.r),
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
                            padding: EdgeInsets.all(8.r),
                            child: Container(
                              height: 300.h,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.r),
                                    child: Text(
                                      LocaleKeys.addingCard.tr(),
                                      style: TextStyle(
                                        color: AppColors.green,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  InputWithoutImage(
                                    label: LocaleKeys.nameOfCardOnwer.tr(),
                                    type: TextInputType.name,
                                  ),
                                  InputWithoutImage(
                                    label: LocaleKeys.cardNum.tr(),
                                    type: TextInputType.number,
                                  ),
                                  Container(
                                    height: 60,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InputWithoutImage(
                                          label: LocaleKeys.validDate.tr(),
                                          type: TextInputType.datetime,
                                        ),
                                        InputWithoutImage(
                                          label: LocaleKeys.cvv.tr(),
                                          type: TextInputType.number,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.r),
                                    child: CustomeButton(
                                        text: LocaleKeys.addingCard.tr(),
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
                text: LocaleKeys.addingCard.tr(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
