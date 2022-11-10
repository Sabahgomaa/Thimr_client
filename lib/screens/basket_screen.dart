import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/components/item_basket.dart';
import 'package:thimar_client/screens/nav_bar/pages/orders/components/completed_order.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/styles.dart';
import 'package:thimar_client/shared/widgets/button.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            MagicRouter.pop();
          },
          child: Image.asset(Assets.images.back.path),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'السلة',
          style: TextStyle(
              color: AppColors.green,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        //physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              //scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return BasketItem();
              },
              // physics: NeverScrollableScrollPhysics(),
            ),
            Container(
              width: 342.w,
              height: 70.h,
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'عندك كوبون ؟ ادخل رقم الكوبون',
                            border: myInputBorderStyle,
                            enabledBorder: myInputBorderStyle,
                            focusedBorder: myInputBorderStyle,
                            hintStyle: const TextStyle(
                                color: Color(0xffAFAFAF), fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    CustomeButton(
                      pressed: () {},
                      width: 79.w,
                      height: 39.h,
                      textColor: AppColors.whiteApp,
                      text: 'تطبيق',
                      fontSize: 15.sp,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8.0,
                right: 20,
                top: 8,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  'جميع الأسعار تشمل قيمة الضريبة المضافة 15%',
                  style: TextStyle(color: AppColors.green, fontSize: 15.sp),
                ),
              ),
            ),
            Container(
              width: 342.5.w,
              height: 130.h,
              decoration: BoxDecoration(
                color: AppColors.whiteApp,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'إجمالي المنتجات',
                          style: TextStyle(
                            color: AppColors.green,
                            fontSize: 15.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '180ر.س',
                          style: TextStyle(
                            color: AppColors.green,
                            fontSize: 15.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'الخصم',
                          style: TextStyle(
                            color: AppColors.green,
                            fontSize: 15.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '40ر.س',
                          style: TextStyle(
                            color: AppColors.green,
                            fontSize: 15.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'المجموع',
                          style: TextStyle(
                            color: AppColors.green,
                            fontSize: 15.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '220ر.س',
                          style: TextStyle(
                            color: AppColors.green,
                            fontSize: 15.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomeButton(
              pressed: () {
                MagicRouter.navigateTo(
                  CompletedOrder(),
                );
              },
              width: 343.w,
              height: 60.h,
              textColor: AppColors.whiteApp,
              text: 'الانتقال لإتمام الطلب',
              fontSize: 15.sp,
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
