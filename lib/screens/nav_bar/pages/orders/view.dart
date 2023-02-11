import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/shared/const/colors.dart';
import '../../../../generated/locale_keys.g.dart';
import 'components/list_current_order.dart';
import 'components/list_finished_order.dart';

class OrderView extends StatelessWidget {
  OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.my_orders.tr(),
        ),
      ),
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Column(children: [
            Container(
              height: 54.08.h,
              width: 342.w,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyLite),
                  borderRadius: BorderRadius.circular(10.r)),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                  color: AppColors.green,
                ),
                labelStyle:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                labelColor: Colors.white,
                unselectedLabelStyle:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                unselectedLabelColor: AppColors.grey,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: LocaleKeys.active.tr(),
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: LocaleKeys.expired.tr(),
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                children: [CurrentOrderScreen(), FinishedOrderScreen()],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
