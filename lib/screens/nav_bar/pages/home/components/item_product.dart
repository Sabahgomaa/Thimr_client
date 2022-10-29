import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/widgets/button.dart';

import '../../../../../../shared/const/colors.dart';

class ProductItem extends StatelessWidget {
  ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    Assets.images.product.path,
                  ),
                  Padding(
                    padding:EdgeInsets.only(top: 2.r,left: 15.r),
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          // border: Border.all(color: AppColors.greyLite),
                          borderRadius: BorderRadius.only(
                          topLeft:  Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                          ),
                        ),
                        width: 54.w,
                        height: 20.h,

                        child: Center(
                          child: Text('-45%',style: TextStyle(
                            color: AppColors.whiteApp,
                            fontSize: 14.sp,
                          ),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2.r, top: 2.r),
                        child: Text(
                          'طماطم',
                          style: TextStyle(
                            color: AppColors.green,
                            fontSize: 16.sp,
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
                            fontSize: 12.sp,
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
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '56ر.س',
                            style: TextStyle(
                              color: AppColors.green,
                              fontSize: 13.sp,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Container(
                                width: 30.w,
                                height: 30.h,
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
              SizedBox(
                height: 15.h,
              ),
              CustomeButton(
                pressed: () {},
                width: 115.w,
                height: 30.h,
                text: 'أضف للسلة',
                fontSize: 12.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
