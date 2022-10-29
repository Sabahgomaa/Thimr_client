import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/components/summary_order_details.dart';
import 'package:thimar_client/screens/nav_bar/pages/orders/components/drop_down_addresses.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/button.dart';

class CompletedOrder extends StatelessWidget {
  const CompletedOrder({Key? key}) : super(key: key);

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
          'إتمام الطلب',
          style: TextStyle(
              color: AppColors.green,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'الاسم : ',
                    style: TextStyle(
                        color: AppColors.green,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'محمد',
                    style: TextStyle(
                        color: AppColors.green,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Text(
                    'الجوال : ',
                    style: TextStyle(
                        color: AppColors.green,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '05068285914',
                    style: TextStyle(
                        color: AppColors.green,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'اختر عنوان التوصيل',
                    style: TextStyle(
                        color: AppColors.green,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(Assets.images.add.path)
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              DropDownAddresses(
                itemsList: [],
                onChanged: (String) {},
                value: '',
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تحديد وقت التوصيل',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 163.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: AppColors.greyLite,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Container(
                        width: 163.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: AppColors.greyLite,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ملاحظات وتعليمات',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 342,
                        height: 117.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: AppColors.greyLite,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'اختر طريقة الدفع',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 103.67.w,
                        height: 49.54.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: AppColors.greyLite,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        width: 103.67.w,
                        height: 49.54.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: AppColors.greyLite,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ), Container(
                        width: 103.67.w,
                        height: 49.54.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: AppColors.greyLite,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  )
                ],
              ),SizedBox(
                height: 20.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ملخص الطلب',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SummaryOrderDetails(),
                  ),
                ],
              ),
              CustomeButton(
                pressed: () {},
                width: 343.w,
                height: 60.h,
                radius: 5,
                text: 'إنهاء الطلب',
                fontSize: 11.sp,
                buttonColor: AppColors.green,
                textColor: AppColors.whiteApp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
