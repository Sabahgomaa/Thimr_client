import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/const/colors.dart';

import '../../../generated/locale_keys.g.dart';
import '../model.dart';

class ItemBasket extends StatelessWidget {
  ItemBasket({Key? key, required this.model}) : super(key: key);
  final Carts model;

  // final bloc = KiwiContainer().resolve<CartBloc>();
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.network(
                    model.image,
                    fit: BoxFit.fill,
                    width: 92.w,
                    height: 78.h,
                    // Assets.images.product.path,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Column(
                    children: [
                      Text(
                        model.title,
                        style: TextStyle(
                          color: AppColors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                      Text(
                        model.priceBeforeDiscount.toString() +
                            LocaleKeys.rial.tr(),
                        style: TextStyle(
                          color: AppColors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.r),
                        child: Container(
                          height: 27.h,
                          width: 73.w,
                          decoration: BoxDecoration(
                            color: AppColors.whiteApp,
                            borderRadius: BorderRadius.circular(10.r),
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
              padding: EdgeInsets.all(8.r),
              child: GestureDetector(
                  onTap: () {}, child: Image.asset(Assets.images.delete.path)),
            )
          ],
        ),
      ),
    );
  }
}
