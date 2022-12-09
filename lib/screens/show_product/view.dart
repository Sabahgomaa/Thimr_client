import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/screens/cart/view.dart';
import 'package:thimar_client/screens/show_product/Components/item_increase_decrease.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';

import '../../generated/locale_keys.g.dart';
import 'Components/item_related_product.dart';
import 'bloc/bloc.dart';

class ShowProductScreen extends StatefulWidget {
  final int id;

  ShowProductScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ShowProductScreen> createState() => _ShowProductScreenState();
}

class _ShowProductScreenState extends State<ShowProductScreen> {
  final bloc = KiwiContainer().resolve<ShowProductBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(ShowProductEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
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
              flexibleSpace: Container(
                child: bloc.showProductData == null
                    ? Center(child: CircularProgressIndicator())
                    : Image.network(
                        bloc.showProductData!.data.mainImage,
                        height: 322.h,
                        fit: BoxFit.fill,
                      ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        if (bloc.showProductData!.data.isFavorite == false) {
                          bloc.add(AddToFavoriteEvent(id: widget.id));
                        } else {
                          bloc.add(RemoveToFavoriteEvent(id: widget.id));
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
                                bloc.showProductData == null
                                    ? CircularProgressIndicator()
                                    : Text(
                                        bloc.showProductData!.data.title,
                                        style: TextStyle(
                                          color: AppColors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22.sp,
                                        ),
                                      ),
                                bloc.showProductData == null
                                    ? CircularProgressIndicator()
                                    : Row(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.price.tr() +
                                      '/' +
                                      LocaleKeys.kg.tr(),
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
                                bloc.showProductData == null
                                    ? CircularProgressIndicator()
                                    : Text(
                                        bloc.showProductData!.data.code
                                            .toString(),
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
                                    LocaleKeys.orderDetails.tr(),
                                    style: TextStyle(
                                      color: AppColors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.sp,
                                    ),
                                  ),
                                  bloc.showProductData == null
                                      ? CircularProgressIndicator()
                                      : Text(
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
                                    LocaleKeys.similarProducts.tr(),
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
                            MagicRouter.navigateTo(CartScreen());
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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '45' + LocaleKeys.rial.tr(),
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
        });
  }
}
// if (bloc.showProductData == null) {
// return CircularProgressIndicator();
// } else {}
