import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/screens/basket_screen.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/components/item_increase_decrease.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/components/slider.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';

import 'nav_bar/pages/home/components/item_related_product.dart';


class ShowProductScreen extends StatelessWidget {
  const ShowProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                MagicRouter.pop();
              },
              child: Image.asset(
                Assets.images.back.path,
              ),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 322.h,
        flexibleSpace: SliderComponent(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  MagicRouter.pop();
                },
                child: Image.asset(
                  Assets.images.favoriteIcon.path,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'طماطم',
                            style: TextStyle(
                              color: AppColors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp,
                            ),
                          ),
                          Row(
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
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'السعر / 1كجم',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 19.sp,
                            ),
                          ),
                          IncreaseDecreaseItem(),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            'كود المنتج',
                            style: TextStyle(
                              color: AppColors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '56638',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 19.sp,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'تفاصيل المنتج',
                              style: TextStyle(
                                color: AppColors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                              ),
                            ),
                            Text(
                              'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'منتجات مشابهة',
                              style: TextStyle(
                                color: AppColors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                          Container(
                            height: 180,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return RelatedProduct();
                              },
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 60.h,
              width: double.infinity,
              color: AppColors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      MagicRouter.navigateTo(BasketScreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(Assets.images.sala.path),
                        Text(
                          'إضافة إلي السلة',
                          style: TextStyle(
                            color: AppColors.whiteApp,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '45ر.س',
                      style: TextStyle(
                        color: AppColors.whiteApp,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
