import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/Pages/department_screen.dart';
import 'package:thimar_client/shared/router.dart';
import '../../../../../../shared/const/colors.dart';

class DepartmentItem extends StatelessWidget {
  const DepartmentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MagicRouter.navigateTo(DepartmentScreen());
      },
      child: Column(
        children: [
          Container(
            width: 73.w,
            height: 73.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Assets.images.department.path,
                ),
              ),
            ),
          ),
          Text(
            'الخضار',
            style: TextStyle(
              color: AppColors.green,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          )
        ],
      ),
    );
  }
}
