import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/widgets/button.dart';

import '../../../../../../shared/const/colors.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163.w,
      height: 250.h,
      child: Card(
          child:  Column(children: [
        Expanded(
          flex: 2,
          child: Container(
            width: 150,
            height: 100,
            child: Image.asset(
              'assets/images/product.png',
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'طماطم',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'السعر / 1كجم',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
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
                  fontSize: 16.sp,
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
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(Assets.images.iconAdd.path),
                    )),
              ),
            ],
          ),
        ),
            Expanded(child: CustomeButton(pressed: (){}, width: 115.w, height: 30.h,text: 'أضف للسلة',fontSize: 12.sp,))
      ])),
    );
  }
}
