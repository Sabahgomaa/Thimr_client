import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/shared/widgets/app_bar.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/widgets/button.dart';
import 'package:thimar_client/shared/widgets/input_without_image.dart';
import '../../../../generated/locale_keys.g.dart';

class RechargeNow extends StatelessWidget {
  const RechargeNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: LocaleKeys.chargeNow.tr(),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: 80.r,
          right: 8.r,
        ),
        child: ListView(
          children: [
            Text(
              LocaleKeys.moneyInfo.tr(),
              style: TextStyle(
                color: AppColors.green,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: InputWithoutImage(
                label: LocaleKeys.yourOwnMoney.tr(),
                type: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.r,
                right: 8.r,
              ),
              child: Text(
                LocaleKeys.IdInfo.tr(),
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: InputWithoutImage(
                label: LocaleKeys.name.tr(),
                type: TextInputType.name,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: InputWithoutImage(
                label: LocaleKeys.creditCardNum.tr(),
                type: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputWithoutImage(
                    label: LocaleKeys.validDate.tr(),
                    type: TextInputType.datetime,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  InputWithoutImage(
                    label: LocaleKeys.serialNumber.tr(),
                    type: TextInputType.number,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: CustomButton(
                  pressed: () {},
                  width: 343.w,
                  height: 60.h,
                  text: LocaleKeys.payment.tr(),
                  fontSize: 15.sp,
                ))
          ],
        ),
      ),
    );
  }
}
