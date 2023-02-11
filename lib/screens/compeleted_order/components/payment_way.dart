import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/locale_keys.g.dart';
import '../../../shared/const/colors.dart';

class PaymentWay extends StatelessWidget {
  const PaymentWay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.chooserPaymentType.tr(),
          style: TextStyle(
            color: AppColors.green,
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        DefaultTabController(
          length: 3,
          child: Padding(
            padding: EdgeInsets.only(top: 8.r),
            child: TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
                border: Border.all(color: AppColors.green),
              ),
              labelStyle:
                  TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              labelColor: AppColors.green,
              unselectedLabelStyle:
                  TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              unselectedLabelColor: AppColors.grey,
              tabs: [
                Tab(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/images/money.png'),
                        Text('كاش')
                      ]),
                ),
                Tab(
                  child: Image.asset('assets/images/visa.png'),
                ),
                Tab(
                  child: Image.asset('assets/images/master_card.png'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
