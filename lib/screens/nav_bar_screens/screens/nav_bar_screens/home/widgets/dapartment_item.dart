import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../shared/const/colors.dart';

class DapartmentItem extends StatelessWidget {
  const DapartmentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 73.w,
          height: 73.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/department.png'),
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
    );
  }
}
