import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/screens/show_product/widgets/item_increase_decrease.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/loading_progress.dart';

import '../../gen/assets.gen.dart';
import '../../generated/locale_keys.g.dart';
import '../cart/bloc/bloc.dart';
import 'bloc/bloc.dart';
import 'components/button_cart.dart';
import 'components/list_rated_product.dart';
import 'components/related_product_list.dart';

class ShowProductView extends StatefulWidget {
  final int id;

  ShowProductView({Key? key, required this.id}) : super(key: key);

  @override
  State<ShowProductView> createState() => _ShowProductViewState();
}

class _ShowProductViewState extends State<ShowProductView> {
  final bloc = KiwiContainer().resolve<ShowProductBloc>();
  final blocCart = KiwiContainer().resolve<CartBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(ShowProductEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            return bloc.showProductData == null
                ? LoadingProgress()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              child: Image.network(
                                bloc.showProductData!.data.mainImage,
                                height: 322.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.r),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(4.r),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          MagicRouter.pop();
                                        },
                                        child: Image.asset(
                                          Assets.images.back.path,
                                          color: AppColors.green,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(4.r),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (bloc.showProductData!.data
                                                  .isFavorite ==
                                              false) {
                                            bloc.add(
                                              AddToFavoriteEvent(id: widget.id),
                                            );
                                          } else {
                                            bloc.add(
                                              RemoveToFavoriteEvent(
                                                id: widget.id,
                                              ),
                                            );
                                          }
                                          // if (bloc.showProductData!.data.isFavorite == true) {
                                          //   bloc.add(RemoveToFavoriteEvent(id: widget.id));
                                          // }
                                          // MagicRouter.navigateTo(page);
                                        },
                                        child: Image.asset(
                                          Assets.images.favoriteIcon.path,
                                        ),
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
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    bloc.showProductData!.data.title,
                                    style: TextStyle(
                                      color: AppColors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.sp,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        bloc.showProductData!.data.price
                                                .toString() +
                                            LocaleKeys.rial.tr(),
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
                                        bloc.showProductData!.data
                                                .priceBeforeDiscount
                                                .toString() +
                                            LocaleKeys.rial.tr(),
                                        style: TextStyle(
                                          color: AppColors.green,
                                          fontSize: 16.sp,
                                          decoration:
                                              TextDecoration.lineThrough,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    LocaleKeys.price.tr() +
                                        ' / 1' +
                                        LocaleKeys.kg.tr(),
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 19.sp,
                                    ),
                                  ),
                                  ItemIncreaseDecrease(
                                    onChange: (newCount) {
                                      print("XOXOXOXXOXOOOXXOXOXOXO $newCount");
                                      bloc.amount = newCount;
                                      print(
                                          "XOXOXOXXOXOOOXXOXOXOXO ${bloc.amount}");
                                    },
                                  ),
                                ],
                              ),
                              Divider(),
                              Padding(
                                padding: EdgeInsets.all(8.r),
                                child: Row(
                                  children: [
                                    Text(
                                      LocaleKeys.productCode.tr(),
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
                                      bloc.showProductData!.data.code
                                          .toString(),
                                      style: TextStyle(
                                        color: AppColors.grey,
                                        fontSize: 19.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(),
                              Align(
                                alignment: Alignment.topRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.orderDetails.tr(),
                                      style: TextStyle(
                                        color: AppColors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.sp,
                                      ),
                                    ),
                                    Text(
                                      bloc.showProductData!.data.description
                                          .toString(),
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
                                      LocaleKeys.rates.tr(),
                                      style: TextStyle(
                                        color: AppColors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.sp,
                                      ),
                                    ),
                                  ),
                                  ListRatedProduct(
                                    id: bloc.showProductData!.data.id,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      LocaleKeys.similarProducts.tr(),
                                      style: TextStyle(
                                        color: AppColors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.sp,
                                      ),
                                    ),
                                  ),
                                  RelatedProductList()
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
          }),
      bottomNavigationBar: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            return bloc.showProductData == null
                ? LoadingProgress()
                : ButtonCart(
                    id: bloc.showProductData!.data.id,
                    bloc: bloc,
                  );
          }),
    );
  }
}
