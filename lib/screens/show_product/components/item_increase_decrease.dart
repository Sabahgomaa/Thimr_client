import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/const/colors.dart';

class IncreaseDecreaseItem extends StatelessWidget {
  const IncreaseDecreaseItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.r),
      child: Container(
        height: 40.h,
        width: 109.w,
        decoration: BoxDecoration(
          color: AppColors.whiteApp,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(4.r),
              child: SizedBox(
                height: 30.h,
                width: 30.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Center(child: Image.asset(Assets.images.favoriteIcon.path)),
                ),
              ),
            ),
            Text(
              '0',
              style: TextStyle(
                color: AppColors.green,
                fontSize: 15.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.r),
              child: SizedBox(
                height: 30.h,
                width: 30.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Center(child: Image.asset(Assets.images.favoriteIcon.path)),
                ),
              ),
            ),
           // SizedBox()
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //     height: 30.h,
            //     width: 30.w,
            //     child: Image.asset(
            //       Assets.images.minus.path,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
