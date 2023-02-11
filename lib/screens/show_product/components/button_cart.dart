import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/generated/locale_keys.g.dart';
import 'package:thimar_client/screens/show_product/bloc/bloc.dart';
import 'package:thimar_client/shared/widgets/loading_progress.dart';

import '../../../shared/const/colors.dart';
import '../../../shared/core/cach_helper.dart';
import '../../../shared/router.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/toast.dart';
import '../../auth_cycle/log_in/view.dart';
import '../../cart/bloc/bloc.dart';
import '../../cart/view.dart';
import '../../nav_bar/pages/home/view.dart';

///Do Show data from bloc without constructor  ===> still null
///Do Show data from constructor and Wrap BlocBuilder CardButton NextScreen ==> solve null
///
class ButtonCart extends StatelessWidget {
  final int? id;
  final ShowProductBloc bloc;

  ButtonCart({
    Key? key,
    required this.id,
 required   this.bloc ,
  }) : super(key: key);
  final blocCart = KiwiContainer().resolve<CartBloc>()..add(GetCartEvent());

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.h,
        width: double.infinity,
        color: AppColors.green,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 16.r),
                child: Container(
                  height: 32.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    color: AppColors.greenLite,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Image.asset('assets/images/ic_shopping_cart.png'),
                ),
              ),
              BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is AddCartFailedState) {
                      Toast.show(state.msg.toString(), context);
                    }
                    ;
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        bloc.add(AddCartEvent(
                          id: id!
                        ));
                        CacheHelper.getDeviceToken().isEmpty
                            ? MagicRouter.navigateTo(LogInScreen())
                            : showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return bloc.showProductData == null
                                      ? LoadingProgress()
                                      : Container(
                                          height: 210.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(17),
                                                topRight: Radius.circular(17)),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.r),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(10.r),
                                                  child: Container(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Text(
                                                        LocaleKeys
                                                            .productAddedSuccess
                                                            .tr(),
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.green,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  height: 1,
                                                ),
                                                Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      child: Image.network(
                                                        bloc.showProductData!.data.mainImage,
                                                        fit: BoxFit.fill,
                                                        width: 69.w,
                                                        height: 64.h,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.r),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            bloc.showProductData!.data.title,
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .green,
                                                              fontSize: 12.sp,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Text(
                                                              "الكمية: 1",
                                                              style: TextStyle(
                                                                color: AppColors
                                                                    .grey,
                                                                fontSize: 12.sp,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Text(
                                                              "السعر: ${bloc.showProductData!.data.price}",
                                                              style: TextStyle(
                                                                color: AppColors
                                                                    .green,
                                                                fontSize: 12.sp,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  height: 1,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(12.r),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      CustomButton(
                                                        pressed: () {
                                                          MagicRouter
                                                              .navigateTo(
                                                                  CartScreen());
                                                        },
                                                        text: LocaleKeys
                                                            .moveToCart
                                                            .tr(),
                                                        fontSize: 14.sp,
                                                        height: 49.h,
                                                        width: 162.w,
                                                      ),
                                                      CustomButton(
                                                        pressed: () {
                                                          MagicRouter
                                                              .navigateAndPopAll(
                                                            HomeView(),
                                                          );
                                                        },
                                                        text: LocaleKeys
                                                            .exploreOffers
                                                            .tr(),
                                                        fontSize: 14.sp,
                                                        height: 49.h,
                                                        width: 162.w,
                                                        textColor:
                                                            AppColors.green,
                                                        buttonColor:
                                                            Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                });
                      },
                      child: Row(
                        children: [
                          Image.asset(Assets.images.sala.path),
                          Text(
                            LocaleKeys.addToCart.tr(),
                            style: TextStyle(
                              color: AppColors.whiteApp,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder(
                bloc: blocCart,
                builder: (context, state) {
                  return blocCart.cartData == null
                      ? LoadingProgress()
                      : blocCart.cartData!.totalPriceWithVat == 0
                          ? Text('')
                          : Text(
                              "${blocCart.cartData!.totalPriceWithVat}" +
                                  " " +
                                  LocaleKeys.rial.tr(),
                              style: TextStyle(
                                color: AppColors.whiteApp,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                            );
                }),
          ),
        ]));
  }
}
