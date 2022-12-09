import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/screens/compeleted_order/view.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/styles.dart';
import 'package:thimar_client/shared/widgets/button.dart';

import '../../generated/locale_keys.g.dart';
import 'bloc/bloc.dart';
import 'components/item_basket.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<CartBloc>()..add(GetCartEvent());

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
        title: Text(
          LocaleKeys.cart.tr(),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (bloc.cartData == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      //scrollDirection: Axis.horizontal,
                      itemCount: bloc.cartData!.data.length,
                      itemBuilder: (context, index) {
                        return ItemBasket(
                          model: bloc.cartData!.data[index],
                        );
                      },
                      // physics: NeverScrollableScrollPhysics(),
                    ),
                    Container(
                      width: 342.w,
                      height: 70.h,
                      child: Form(
                        key: bloc.formKey,
                        child: Stack(
                          children: [
                            Expanded(
                              child: Center(
                                child: TextFormField(
                                  controller: bloc.code,
                                  decoration: InputDecoration(
                                    hintText: LocaleKeys
                                        .haveCouponEnterCouponNum
                                        .tr(),
                                    border: myInputBorderStyle,
                                    enabledBorder: myInputBorderStyle,
                                    focusedBorder: myInputBorderStyle,
                                    hintStyle: TextStyle(
                                        color: Color(0xffAFAFAF),
                                        fontSize: 15.sp),
                                  ),
                                ),
                              ),
                            ),
                            BlocConsumer(
                              bloc: bloc,
                              listener: (BuildContext context, state) {
                                if (state is ApplyCouponFailedState) {
                                  Fluttertoast.showToast(msg: state.error);
                                }
                                if (state is ApplyCouponSuccessState) {
                                  bloc.formKey.currentState!.reset();
                                  Fluttertoast.showToast(msg: state.msg);
                                }
                              },
                              builder: (BuildContext context, Object? state) {
                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: CustomeButton(
                                    pressed: () {
                                      if (bloc.formKey.currentState!
                                          .validate()) {
                                        bloc.add(ApplyCouponCartEvent());
                                      }
                                    },
                                    width: 79.w,
                                    height: 65.h,
                                    textColor: AppColors.whiteApp,
                                    text: LocaleKeys.app.tr(),
                                    fontSize: 15.sp,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 8.r,
                        right: 20.r,
                        top: 8.r,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'جميع الأسعار تشمل قيمة الضريبة المضافة 15%',
                          style: TextStyle(
                              color: AppColors.green, fontSize: 15.sp),
                        ),
                      ),
                    ),
                    Container(
                      width: 342.5.w,
                      height: 160.h,
                      decoration: BoxDecoration(
                        color: AppColors.whiteApp,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.totalProducts.tr(),
                                  style: TextStyle(
                                    color: AppColors.green,
                                    fontSize: 15.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  bloc.cartData!.totalPriceBeforeDiscount
                                          .toString() +
                                      ' ' +
                                      LocaleKeys.rial.tr(),
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
                                  LocaleKeys.sale.tr(),
                                  style: TextStyle(
                                    color: AppColors.green,
                                    fontSize: 15.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  bloc.cartData!.totalDiscount.toString() +
                                      ' ' +
                                      LocaleKeys.rial.tr(),
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
                                  LocaleKeys.total.tr(),
                                  style: TextStyle(
                                    color: AppColors.green,
                                    fontSize: 15.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  bloc.cartData!.totalPriceWithVat.toString() +
                                      ' ' +
                                      LocaleKeys.rial.tr(),
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
                  ],
                ),
              );
            }
          }),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.r),
        child: CustomeButton(
          pressed: () {
            MagicRouter.navigateTo(
              CompletedOrderScreen(),
            );
          },
          width: 360.w,
          height: 60.h,
          textColor: AppColors.whiteApp,
          text: LocaleKeys.goToConfirmOrder.tr(),
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
