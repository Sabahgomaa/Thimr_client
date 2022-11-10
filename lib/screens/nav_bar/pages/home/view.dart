import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/components/search_bar.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/components/slider.dart';

import 'components/main_app_bar.dart';
import 'components/list_category.dart';
import 'components/list_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Container(
      //       width: 72.w,
      //       height: 22.28.h,
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage(Assets.images.logot.path),
      //         ),
      //       ),
      //     ),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Column(
      //     children: [
      //       Text(
      //         'التوصيل إلى',
      //         style: TextStyle(color: AppColors.green, fontSize: 12.sp),
      //         textAlign: TextAlign.center,
      //       ),
      //       Text(
      //         'شارع الملك فهد - جدة',
      //         style: TextStyle(color: AppColors.green, fontSize: 14.sp),
      //         textAlign: TextAlign.center,
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(15),
      //           color: AppColors.grey.withOpacity(.4),
      //         ),
      //         child: GestureDetector(
      //           onTap: () {
      //             MagicRouter.navigateTo(BasketScreen());
      //           },
      //           child: Image.asset(Assets.images.sala.path),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      appBar: MainAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.r),
              child: SearchBar(),
            ),
            SliderComponent(),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Text(
                  'الأقسام',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
            ListCategories(),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Text(
                  'الأصناف',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
            ListProducts(),
          ],
        ),
      ),
    );
  }
}
