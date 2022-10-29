import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/const/colors.dart';

class BasketItem extends StatelessWidget {
  const BasketItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 342.w,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  Assets.images.product.path,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'طماطم',
                        style: TextStyle(
                          color: AppColors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                      Text(
                        '45ر.س',
                        style: TextStyle(
                          color: AppColors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 27.h,
                          width: 73.w,
                          decoration: BoxDecoration(
                            color: AppColors.whiteApp,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 30.h,
                                  width: 30.w,
                                  child: GestureDetector(
                                    child: Image.asset(
                                      Assets.images.add.path,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '',
                                style: TextStyle(
                                  color: AppColors.green,
                                  fontSize: 12.sp,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 30.h,
                                  width: 30.w,
                                  child: Image.asset(
                                    Assets.images.minus.path,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/delete.png'),
            )
          ],
        ),
      ),
    );
  }
}
