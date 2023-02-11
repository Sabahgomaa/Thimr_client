import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/screens/cart/bloc/bloc.dart';
import 'package:thimar_client/shared/const/colors.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../shared/widgets/button.dart';
import '../model.dart';

class ItemCart extends StatefulWidget {
  final Function(int newCount) onChange;

  ItemCart(
      {Key? key,
      required this.model,
      required this.bloc,
      required this.onChange})
      : super(key: key);
  final Carts model;
  final CartBloc bloc;

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  final bloc = KiwiContainer().resolve<CartBloc>();
  int count = 0;

  @override
  void initState() {
    super.initState();
    count = widget.model.amount;
  }

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
                    widget.model.image,
                    fit: BoxFit.fill,
                    width: 92.w,
                    height: 78.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.model.title,
                        style: TextStyle(
                          color: AppColors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                      Text(
                        widget.model.priceBeforeDiscount.toString() +
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
                          width: 72.w,
                          decoration: BoxDecoration(
                            color: AppColors.whiteApp,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 4.r),
                                child: CustomButton(
                                  buttonColor: Colors.white,
                                  height: 23.h,
                                  width: 23.w,
                                  pressed: () {
                                    setState(() {
                                      count++;
                                    });
                                    widget.onChange(count);
                                  },
                                  text: '+',
                                  fontSize: 11.sp,
                                  textColor: AppColors.green,
                                ),
                              ),
                              Text(
                                '${count}',
                                style: TextStyle(
                                  color: AppColors.green,
                                  fontSize: 11.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.r),
                                child: CustomButton(
                                  buttonColor: Colors.white,
                                  height: 23.h,
                                  width: 23.w,
                                  pressed: () {
                                    setState(() {
                                      if (count != 1) {
                                        count--;
                                      }
                                    });
                                    widget.onChange(count);
                                  },
                                  text: '-',
                                  fontSize: 11.sp,
                                  textColor: AppColors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Container(
                      //   height: 27.h,
                      //   width: 73.w,
                      //   decoration: BoxDecoration(
                      //     color: AppColors.whiteApp,
                      //     borderRadius: BorderRadius.circular(10.r),
                      //   ),
                      //   child: StatefulBuilder(builder:
                      //       (BuildContext context, StateSetter setState) {
                      //     return Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         GestureDetector(
                      //             onTap: () {
                      //               setState(() {
                      //                 amount++;
                      //               });
                      //             },
                      //             child: Container(
                      //               height: 30.h,
                      //               width: 30.w,
                      //               child: Image.asset(
                      //                 Assets.images.add.path,
                      //               ),
                      //             )),
                      //         Text(
                      //           "${amount}",
                      //           style: TextStyle(
                      //             color: AppColors.green,
                      //             fontSize: 12.sp,
                      //           ),
                      //         ),
                      //         GestureDetector(
                      //           onTap: () {
                      //             if (amount != 1) {
                      //               setState(() {
                      //                 amount--;
                      //               });
                      //             }
                      //           },
                      //           child: Container(
                      //             height: 30.h,
                      //             width: 30.w,
                      //             child: Image.asset(
                      //               Assets.images.minus.path,
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     );
                      //   }),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.all(8.r),
                child: BlocBuilder(
                    bloc: bloc,
                    builder: (context, state) {
                      return GestureDetector(
                          onTap: () {
                            bloc.add(DeleteCartEvent(id: widget.model.id));
                          },
                          child: Image.asset(Assets.images.delete.path));
                    })),
          ],
        ),
      ),
    );
  }
}
