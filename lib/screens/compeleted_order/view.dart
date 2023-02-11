import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/screens/nav_bar/pages/orders/components/summary_order_details.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/button.dart';
import '../../generated/locale_keys.g.dart';
import '../my_account_pages/personal_info/bloc/bloc.dart';
import 'components/delivery_addresses.dart';
import 'components/detect_date_delivery.dart';
import 'components/hints_and_instructions.dart';
import 'components/payment_way.dart';
import 'components/personal_info.dart';

class CompletedOrderScreen extends StatelessWidget {
  CompletedOrderScreen({Key? key}) : super(key: key);

  final blocCart = KiwiContainer().resolve<ProfileBloc>()
    ..add(GetProfileEvent());

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
          LocaleKeys.completeOrder.tr(),
          style: TextStyle(
              color: AppColors.green,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(8.r),
        child: ListView(

          children: [
            PersonalInfo(),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.chooseLocation.tr(),
                  style: TextStyle(
                      color: AppColors.green,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold),
                ),
                Image.asset(Assets.images.icAdd.path)
              ],
            ),
            DeliveryAddresses(),
            SizedBox(
              height: 20.h,
            ),
            DetectDateDelivery(),
            SizedBox(
              height: 20.h,
            ),
            HintsAndInstructions(),
            SizedBox(
              height: 20.h,
            ),
            PaymentWay(),
            SizedBox(
              height: 20.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.orderPref.tr(),
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: SummaryOrderDetails(),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.r),
        child: CustomButton(
          pressed: () {},
          width: 360.w,
          height: 60.h,
          radius: 12.r,
          text: LocaleKeys.finishOrder.tr(),
          fontSize: 15.sp,
          buttonColor: AppColors.green,
          textColor: AppColors.whiteApp,
        ),
      ),
    );
  }
}
