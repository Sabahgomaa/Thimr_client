import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/shared/const/colors.dart';

import '../../../shared/widgets/button.dart';

class ItemIncreaseDecrease extends StatefulWidget {
  final Function(int newCount) onChange;

  ItemIncreaseDecrease({Key? key, required this.onChange}) : super(key: key);

  @override
  State<ItemIncreaseDecrease> createState() => _ItemIncreaseDecreaseState();
}

class _ItemIncreaseDecreaseState extends State<ItemIncreaseDecrease> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.r),
      child: Container(
        height: 50.h,
        width: 120.w,
        decoration: BoxDecoration(
          color: AppColors.whiteApp,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 4.r),
              child: CustomButton(
                buttonColor: Colors.white,
                height: 40.h,
                width: 40.w,
                pressed: () {
                  setState(() {
                    count++;
                  });
                  widget.onChange(count);
                },
                text: '+',
                fontSize: 25,
                textColor: AppColors.green,
              ),
            ),
            Text(
              '${count}',
              style: TextStyle(
                color: AppColors.green,
                fontSize: 15.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.r),
              child: CustomButton(
                buttonColor: Colors.white,
                height: 40.h,
                width: 40.w,
                pressed: () {
                  setState(() {
                    if (count != 1) {
                      count--;
                    }
                  });
                  widget.onChange(count);
                },
                text: '-',
                fontSize: 25,
                textColor: AppColors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
