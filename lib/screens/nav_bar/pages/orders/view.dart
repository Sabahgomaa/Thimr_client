import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'components/current_order.dart';
import 'components/finished_order.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'طلباتي',
          style: TextStyle(
              color: AppColors.green,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 54.08.h,
              width: 342.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyLite),
                borderRadius: BorderRadius.circular(12)
              ),
              child: TabBar(
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12.0,
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
                    text: 'الحاليه',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'المنتهية',
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                children: [
                  CurrentOrderScreen(),
                  EndedOrderScreen()
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}