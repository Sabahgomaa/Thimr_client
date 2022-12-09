import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/bloc/bloc.dart';
import 'package:thimar_client/screens/show_product/view.dart';
import 'package:thimar_client/shared/router.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../widgets/item_product.dart';

class ListProducts extends StatelessWidget {
  final bloc = KiwiContainer().resolve<HomeBloc>()..add(GetProductsEvent());

  ListProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (bloc.productData == null) {
            return CircularProgressIndicator();
          } else {
            return Container(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: bloc.productData!.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1.0,
                  childAspectRatio: 163 / 230,
                  mainAxisSpacing: 1.0,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      MagicRouter.navigateTo(ShowProductScreen(
                        id: bloc.productData!.data[index].id,
                      ));
                    },
                    child: ItemProduct(
                      isCard: true,
                      title: bloc.productData!.data[index].title,
                      priceBeforeDiscount: bloc
                              .productData!.data[index].priceBeforeDiscount
                              .toString() +
                          LocaleKeys.rial.tr(),
                      price: bloc.productData!.data[index].price.toString() +
                          LocaleKeys.rial.tr(),
                      image: bloc.productData!.data[index].mainImage,
                      id: bloc.productData!.data[index].id,
                      discount:
                          bloc.productData!.data[index].discount.toString(),
                      ammount: bloc.productData!.data[index].amount.toString(),
                    ),
                  );
                },
              ),
            );
          }
        });
  }
}
