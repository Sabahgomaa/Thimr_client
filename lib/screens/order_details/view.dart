import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/widgets/app_bar.dart';
import 'package:thimar_client/screens/nav_bar/pages/orders/components/summary_order_details.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/widgets/button.dart';

import '../../generated/locale_keys.g.dart';
import 'bloc/bloc.dart';

class DetailsOrderView extends StatefulWidget {
  final int id;
  final bool isCurrent;

  DetailsOrderView({
    required this.id,
    required this.isCurrent,
  });

  @override
  State<DetailsOrderView> createState() => _DetailsOrderViewState();
}

class _DetailsOrderViewState extends State<DetailsOrderView> {
  final bloc = KiwiContainer().resolve<ShowOrderBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(GetShowOrderEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: LocaleKeys.orderDetails.tr(),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.only(
                bottom: 8.r,
                right: 20.r,
                top: 8.r,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  LocaleKeys.deliveryAddress.tr(),
                  style: TextStyle(
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Container(
                width: 343.w,
                height: 100.h,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'المنزل',
                              style: TextStyle(
                                color: AppColors.green,
                                fontSize: 15.sp,
                              ),
                            ),
                            Text(
                              'شقة 40',
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 12.sp,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              'شارع العليا الرياض السعودية',
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          Assets.images.photoProfile.path,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 8.r,
                right: 20.r,
                top: 8.r,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  LocaleKeys.orderPref.tr(),
                  style: TextStyle(
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp),
                ),
              ),
            ),
            SummaryOrderDetails(),
            SizedBox(
              height: 100.h,
            ),
            if (widget.isCurrent == true)
              CustomButton(
                pressed: () {},
                width: 343.w,
                height: 60.h,
                radius: 5.r,
                text: LocaleKeys.orderCanceled.tr(),
                fontSize: 11.sp,
                buttonColor: AppColors.redLite,
                textColor: AppColors.red,
              ),
            if (widget.isCurrent == false)
              CustomButton(
                pressed: () {},
                width: 343.w,
                height: 60.h,
                radius: 5.r,
                text: LocaleKeys.rateProducts.tr(),
                fontSize: 11.sp,
                buttonColor: AppColors.green,
                textColor: AppColors.whiteApp,
              ),
          ],
        ),
      ),
    );
  }
}
