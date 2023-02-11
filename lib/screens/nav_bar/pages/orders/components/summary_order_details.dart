import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/shared/const/colors.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../../../../shared/widgets/loading_progress.dart';
import '../../../../cart/bloc/bloc.dart';

class SummaryOrderDetails extends StatelessWidget {
  SummaryOrderDetails({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<CartBloc>()..add(GetCartEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        buildWhen: (previous, current) =>
            current is GetCartSuccessState || current is GetCartSuccessState,
        builder: (context, state) {
          if (state is GetCartLoadingState) {
            return LoadingProgress();
          } else {
            return bloc.cartData == null
                ? Center(
                    child: Text(
                      " Order Empty",
                      style: TextStyle(),
                    ),
                  )
                : Container(
                    width: 342.5.w,
                    height: 139.h,
                    // color: AppColors.greenLite,
                    decoration: BoxDecoration(
                      color: AppColors.whiteApp,
                      // border: Border.all(color: AppColors.greyLite),
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
                                LocaleKeys.totalProducts.tr(),
                                style: TextStyle(
                                  color: AppColors.green,
                                  fontSize: 15.sp,
                                  // fontWeight: FontWeight.bold,
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
                                  // fontWeight: FontWeight.bold,
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
                                LocaleKeys.deliveryPrice.tr(),
                                style: TextStyle(
                                  color: AppColors.green,
                                  fontSize: 15.sp,
                                  // fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                bloc.cartData!.deliveryCost.toString() +
                                    ' ' +
                                    LocaleKeys.rial.tr(),
                                style: TextStyle(
                                  color: AppColors.green,
                                  fontSize: 15.sp,
                                  // fontWeight: FontWeight.bold,
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
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
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
                                bloc.cartData!.totalPriceWithVat
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
                          // Divider(),
                          // Center(
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Text(
                          //         'تم الدفع بواسطة',
                          //         style: TextStyle(
                          //           color: AppColors.green,
                          //           fontSize: 15.sp,
                          //           // fontWeight: FontWeight.bold,
                          //         ),
                          //         textAlign: TextAlign.center,
                          //       ),
                          //       Image.asset(
                          //         Assets.images.visa.path,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
          }
        });
  }
}
