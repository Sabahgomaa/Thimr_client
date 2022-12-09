import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/const/colors.dart';

import '../../../generated/locale_keys.g.dart';

class RelatedProduct extends StatelessWidget {
  const RelatedProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    width: 116.w,
                    height: 94.h,
                    child: Image.asset(
                      Assets.images.product.path,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.r, left: 2.r),
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
                padding: EdgeInsets.all(4.r),
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
                          LocaleKeys.price.tr() + '/' + LocaleKeys.kg.tr(),
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
                            '45' + LocaleKeys.rial.tr(),
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
                            '56' + LocaleKeys.rial.tr(),
                            style: TextStyle(
                              color: AppColors.green,
                              fontSize: 10.sp,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Container(
                                width: 24.w,
                                height: 24.h,
                                decoration: BoxDecoration(
                                    color: AppColors.green,
                                    borderRadius: BorderRadius.circular(3.r)),
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
