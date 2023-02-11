import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/bloc/bloc.dart';
import 'package:thimar_client/screens/show_product/view.dart';
import 'package:thimar_client/shared/router.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../../shared/widgets/loading_progress.dart';
import '../widgets/item_product.dart';

class ListProducts extends StatefulWidget {
  ListProducts({Key? key}) : super(key: key);

  @override
  State<ListProducts> createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  final bloc = KiwiContainer().resolve<HomeBloc>()..add(GetProductsEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        buildWhen: (previous, current) =>
            current is GetProductsLoadingState ||
            current is GetProductsSuccessState,
        builder: (context, state) {
          if (state is GetProductsLoadingState) {
            return LoadingProgress();
          } else {
            return bloc.productData == null
                ? Center(
                    child: Text(
                      "",
                      style: TextStyle(),
                    ),
                  )
                : SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  physics: NeverScrollableScrollPhysics(),
                  onLoading: bloc.reload,
                  onRefresh: bloc.refresh,
                  controller: bloc.refreshController,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: bloc.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.0,
                      childAspectRatio: 163.w / 250.h,
                      mainAxisSpacing: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          MagicRouter.navigateTo(ShowProductView(
                            id: bloc.products[index].id,
                          ));
                        },
                        child: ItemProduct(
                          isCard: true,
                          title: bloc.products[index].title,
                          priceBeforeDiscount: bloc
                                  .products[index].priceBeforeDiscount
                                  .toString() +
                              LocaleKeys.rial.tr(),
                          price: bloc.products[index].price.toString() +
                              LocaleKeys.rial.tr(),
                          image: bloc.products[index].mainImage,
                          id: bloc.products[index].id,
                          discount: bloc.products[index].discount,
                        ),
                      );
                    },
                  ),
                );
          }
        });
  }
}
