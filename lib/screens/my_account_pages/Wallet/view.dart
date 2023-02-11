import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/generated/locale_keys.g.dart';
import 'package:thimar_client/shared/widgets/app_bar.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/button.dart';

import '../../recharge_now/view.dart';
import '../../transaction_history/view.dart';
import 'components/item_wallet.dart';

class WalletView extends StatelessWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(title:LocaleKeys.wallet.tr(),),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            width: 343.w,
            height: 168.h,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:EdgeInsets.all(4.r),
                    child: Text(
                      'رصيدك',
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.r),
                    child: Text(
                      '255' +LocaleKeys.rial.tr(),
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(8.r),
            child: DottedBorder(
              dashPattern: [4, 5],
              strokeWidth: 1,
              strokeCap: StrokeCap.round,
              borderType: BorderType.RRect,
              color: AppColors.green,
              radius: Radius.circular(10),
              child: CustomButton(
                pressed: () {
                  MagicRouter.navigateTo(RechargeNow());
                },
                width: 355.w,
                height: 54.h,
                fontSize: 15.sp,
                buttonColor: AppColors.greyLite.withOpacity(.2),
                textColor: AppColors.green,
                text:LocaleKeys.chargeNow.tr(),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Text(
                    LocaleKeys.transactionsHistory.tr(),
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: (){
                    MagicRouter.navigateTo(TransactionHistoryView());
                  },
                ),
                Text(
                  LocaleKeys.seeAll.tr(),
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 15.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            height: 220.h,
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ItemPocket();
                }),
          )
        ],
      ),
    );
  }
}
