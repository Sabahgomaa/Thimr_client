import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/const/colors.dart';

class RelatedProduct extends StatelessWidget {
  const RelatedProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    width: 116,
                    height: 94,
                    child: Image.asset(
                      Assets.images.product.path,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.r, left: 15.r),
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                          ),
                        ),
                        width: 43.w,
                        height: 16.h,
                        child: Center(
                          child: Text(
                            '-45%',
                            style: TextStyle(
                              color: AppColors.whiteApp,
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2.r, top: 2.r),
                        child: Text(
                          'طماطم',
                          style: TextStyle(
                            color: AppColors.green,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2.r, top: 2.r),
                        child: Text(
                          'السعر / 1كجم',
                          style: TextStyle(
                            color: AppColors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.r, top: 2.r),
                      child: Row(
                        children: [
                          Text(
                            '45ر.س',
                            style: TextStyle(
                              color: AppColors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '56ر.س',
                            style: TextStyle(
                              color: AppColors.green,
                              fontSize: 10.sp,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Container(
                                width: 24.w,
                                height: 24.h,
                                decoration: BoxDecoration(
                                    color: AppColors.green,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child:
                                        Image.asset(Assets.images.iconAdd.path),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
