import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/shared/widgets/loading_progress.dart';
import '../../../../generated/locale_keys.g.dart';
import '../home/widgets/item_product.dart';
import 'bloc/bloc.dart';

class FavoritesView extends StatelessWidget {
  FavoritesView({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<FavoriteBloc>()..add(GetFavoriteEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.favorites.tr(),
          ),
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder(
            bloc: bloc,
            buildWhen: (previous, current) =>
                current is GetFavoriteLoadingState ||
                current is GetFavoriteSuccessState,
            builder: (context, state) {
              if (state is GetFavoriteLoadingState) {
                return LoadingProgress();
              } else {
                return bloc.favoriteData == null
                    ? Center(
                        child: Text(
                        "Current Empty",
                        style: TextStyle(),
                      ))
                    : GridView.builder(
                        itemCount: bloc.favoriteData!.favorites.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 1.0,
                          childAspectRatio: 163 / 230,
                          mainAxisSpacing: 1.0,
                        ),
                        itemBuilder: (context, index) => ItemProduct(
                          title: bloc.favoriteData!.favorites[index].title,
                          price: bloc.favoriteData!.favorites[index].price
                                  .toString() +
                              LocaleKeys.rial.tr(),
                          priceBeforeDiscount: bloc.favoriteData!
                                  .favorites[index].priceBeforeDiscount
                                  .toString() +
                              LocaleKeys.rial.tr(),
                          image: bloc.favoriteData!.favorites[index].mainImage,
                          discount:
                              bloc.favoriteData!.favorites[index].discount,
                        ),
                      );
              }
            }));
  }
}
