import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/screens/auth_cycle/log_in/view.dart';
import 'package:thimar_client/screens/cart/view.dart';
import 'package:thimar_client/screens/show_product/bloc/bloc.dart';
import 'package:thimar_client/shared/core/cach_helper.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/button.dart';
import 'package:thimar_client/shared/widgets/toast.dart';

import '../../../../../../shared/const/colors.dart';
import '../../../../../generated/locale_keys.g.dart';

class ItemProduct extends StatelessWidget {
  final bool? isCard;
  final int? id;
  final num discount;
  final String title, priceBeforeDiscount, price, image;
  final bloc = KiwiContainer().resolve<ShowProductBloc>();

  ItemProduct({
    Key? key,
    this.isCard,
    this.title = "",
    this.priceBeforeDiscount = '',
    this.price = '',
    this.image = 'Assets.images.product.path',
    this.id,
    this.discount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(30.r),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(17.r)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                  width: 145.w,
                  height: 117.h,
                  // Assets.images.product.path,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                  ),
                  width: 60.w,
                  height: 20.h,
                  child: Center(
                    child: Text(
                      "${discount * 100}%",
                      // discount!,
                      style: TextStyle(
                        color: AppColors.whiteApp,
                        fontSize: 14.sp,
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
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 2.r, top: 2.r),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
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
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.r, top: 2.r),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          color: AppColors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        priceBeforeDiscount,
                        style: TextStyle(
                          color: AppColors.green,
                          fontSize: 13.sp,
                          decoration: TextDecoration.lineThrough,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isCard == true)
            BlocConsumer(
              bloc: bloc,
              listener: (context, state) {
                if (state is AddCartFailedState) {
                  Toast.show(state.msg.toString(), context);
                }
              },
              builder: (context, state) {
                return Center(
                  child: CustomButton(
                    isLoading: state is AddCartLoadingState,
                    pressed: () {
                      bloc.add(
                        AddCartEvent(
                          id: id!,
                        ),
                      );
                      CacheHelper.getDeviceToken().isEmpty
                          ? MagicRouter.navigateTo(LogInScreen())
                          : showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
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
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                LocaleKeys.productAddedSuccess
                                                    .tr(),
                                                style: TextStyle(
                                                  color: AppColors.green,
                                                  fontWeight: FontWeight.bold,
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
                                                  BorderRadius.circular(10.r),
                                              child: Image.network(
                                                image,
                                                fit: BoxFit.fill,
                                                width: 69.w,
                                                height: 64.h,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.r),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    title,
                                                    style: TextStyle(
                                                      color: AppColors.green,
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Text(
                                                      "الكمية: 1",
                                                      style: TextStyle(
                                                        color: AppColors.grey,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Text(
                                                      "السعر: ${price}",
                                                      style: TextStyle(
                                                        color: AppColors.green,
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomButton(
                                                pressed: () {
                                                  MagicRouter.navigateTo(
                                                      CartScreen());
                                                },
                                                text:
                                                    LocaleKeys.moveToCart.tr(),
                                                fontSize: 14.sp,
                                                height: 49.h,
                                                width: 162.w,
                                              ),
                                              CustomButton(
                                                pressed: () {
                                                  MagicRouter.pop();
                                                },
                                                text: LocaleKeys.exploreOffers
                                                    .tr(),
                                                fontSize: 14.sp,
                                                height: 49.h,
                                                width: 162.w,
                                                textColor: AppColors.green,
                                                buttonColor: Colors.white,
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
                    width: 115.w,
                    height: 30.h,
                    text: LocaleKeys.addCard.tr(),
                    fontSize: 12.sp,
                  ),
                );
              },
            ),
          if (isCard == false)
            SizedBox(
              height: 1.h,
            )
        ],
      ),
    );
  }
}
