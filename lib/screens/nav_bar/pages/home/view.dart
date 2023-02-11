import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/widgets/search_bar.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/components/slider.dart';
import 'package:thimar_client/shared/router.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../../shared/widgets/loading_progress.dart';
import '../../../show_product/view.dart';
import '../Search/view.dart';
import 'bloc/bloc.dart';
import 'widgets/item_product.dart';
import 'widgets/main_app_bar.dart';
import 'components/list_category.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<HomeBloc>()
    ..add(GetProductsEvent())
    ..add(GetCategoriesEvent())
    ..add(GetSliderEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      backgroundColor: Colors.white,
      body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (bloc.sliderData == null &&
                bloc.categoriesModel == null &&
                bloc.productData == null) {
              return LoadingProgress();
            } else {
              return SmartRefresher(
                enablePullDown:true,
                enablePullUp: true,
                onLoading: bloc.reload,
                onRefresh: bloc.refresh,
                controller: bloc.refreshController,
                child: ListView(
                  // physics: NeverScrollableScrollPhysics(),
                  children: [
                    GestureDetector(
                      onTap: () {
                        MagicRouter.navigateTo(SearchView());
                      },
                      child: Padding(
                        padding: EdgeInsets.all(16.r),
                        child: SearchBar(isEnabled: false),
                      ),
                    ),
                    SliderComponent(),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: EdgeInsets.all(16.r),
                        child: Text(
                          LocaleKeys.sections.tr(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                    ListCategories(),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: EdgeInsets.all(16.r),
                        child: Text(
                          LocaleKeys.models.tr(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder(
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
                                : GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: bloc.products.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 1.0,
                                      childAspectRatio: 163.w / 250.h,
                                      mainAxisSpacing: 1.0,
                                    ),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          MagicRouter.navigateTo(
                                              ShowProductView(
                                            id: bloc.products[index].id,
                                          ));
                                        },
                                        child: ItemProduct(
                                          isCard: true,
                                          title: bloc.products[index].title,
                                          priceBeforeDiscount: bloc
                                                  .products[index]
                                                  .priceBeforeDiscount
                                                  .toString() +
                                              LocaleKeys.rial.tr(),
                                          price: bloc.products[index].price
                                                  .toString() +
                                              LocaleKeys.rial.tr(),
                                          image: bloc.products[index].mainImage,
                                          id: bloc.products[index].id,
                                          discount:
                                              bloc.products[index].discount,
                                        ),
                                      );
                                    },
                                  );
                          }
                        })
                    // ListProducts(),
                  ],
                ),
              );
            }
          }),
    );
  }
}
