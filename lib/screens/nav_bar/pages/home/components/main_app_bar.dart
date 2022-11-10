import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/shared/const/colors.dart';

import '../../../../../gen/assets.gen.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            Row(
              children: [
                Container(
                  width: 20.w,
                  height: 20.h,
                  child: Image.asset(
                    Assets.images.logoApp.path,
                  ),
                ),
                Center(
                  child: Text(
                    'سلة ثمار',
                    style: TextStyle(
                        color: AppColors.green,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'التوصيل إلى',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 12.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'شارع الملك فهد - جدة',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 14.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            // showModalBottomSheet(
            //     context: context,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadiusDirectional.only(
            //           topEnd: Radius.circular(25.r),
            //           topStart: Radius.circular(25.r)),
            //     ),
            //     builder: (context) {
            //       return Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: SingleChildScrollView(
            //           child: Column(children: [
            //             Padding(
            //               padding: const EdgeInsets.all(10.0),
            //               child: Text(
            //                 'LocaleKeys.addresses.tr()',
            //                 style: TextStyle(
            //                     color: AppColors.green,
            //                     fontSize: 15.sp),
            //               ),
            //             ),
            //             Container(
            //               height: 300.h,
            //               child: ListView.builder(
            //                   itemCount: 10,
            //                   itemBuilder: (context, index) {
            //                     return const AddressList();
            //                   }),
            //             ),
            //             GestureDetector(
            //               onTap: () {
            //                 // navigateTo(page: const AddAddress());
            //               },
            //               child: DottedBtn(
            //                 text: 'التوصيل إلى',
            //               ),
            //             ),
            //           ]),
            //         ),
            //       );
            //     });
            //  },
            //   child: Text(
            //     ' LocaleKeys.deliverTo.tr()',
            //     style: TextStyle(
            //       color: AppColors.green,
            //       fontSize: 14.sp,
            //     ),
            //   ),
            // ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  // navigateTo(page: const CartView(), leaveHistory: true);
                },
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.r),
                      height: 37.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        color: AppColors.greyLite.withOpacity(.1),
                          borderRadius: BorderRadius.circular(8.r),
                          image: DecorationImage(
                              image: AssetImage(Assets.images.sala.path))),
                    ),
                    // Container(
                    //   margin: EdgeInsets.symmetric(horizontal: 10.r),
                    //   height: 33.h,
                    //   width: 32.w,
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           image: AssetImage(Assets.images.sala.path))),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
