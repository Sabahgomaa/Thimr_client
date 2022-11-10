import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/screens/my_account_pages/pocket_money/Components/recharge_now.dart';
import 'package:thimar_client/screens/my_account_pages/pocket_money/Components/transaction_history.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/button.dart';

class PocketMoney extends StatelessWidget {
  const PocketMoney({Key? key}) : super(key: key);

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
          'المحفظة',
          style: TextStyle(
            color: AppColors.green,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            width: 343.w,
            height: 168.h,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'رصيدك',
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      '255 ر.س',
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DottedBorder(
              dashPattern: [4, 5],
              strokeWidth: 1,
              strokeCap: StrokeCap.round,
              borderType: BorderType.RRect,
              color: AppColors.green,
              radius: Radius.circular(10),
              child: CustomeButton(
                pressed: () {
                  MagicRouter.navigateTo(RechargeNow());
                },
                width: 355.w,
                height: 54.h,
                fontSize: 15.sp,
                buttonColor: AppColors.greyLite.withOpacity(.2),
                textColor: AppColors.green,
                text: 'اشحن الآن',
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Text(
                    'سجل المعاملات',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: (){
                    MagicRouter.navigateTo(TransactionHistory());
                  },
                ),
                Text(
                  'عرض الكل',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 15.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            height: 200.h,
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    height: 90.h,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 18.w,
                                    height: 18.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColors.grey.withOpacity(.2),
                                    ),
                                    child:
                                        Image.asset(Assets.images.payIcon.path),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'شحن المحفظة',
                                          style: TextStyle(
                                            color: AppColors.green,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '255 س.ر',
                                          style: TextStyle(
                                            color: AppColors.green,
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '27يونيو2021',
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
