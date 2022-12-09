import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import '../../../../generated/locale_keys.g.dart';
import '../home/widgets/item_product.dart';
import 'bloc/bloc.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);
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
            builder: (context, state) {
              if (bloc.favoriteData == null) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                  itemCount: bloc.favoriteData!.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 163 / 230,
                    mainAxisSpacing: 1.0,
                  ),
                  itemBuilder: (context, index) => ItemProduct(
                    title: bloc.favoriteData!.data[index].title,
                    price: bloc.favoriteData!.data[index].price.toString() +
                        LocaleKeys.rial.tr(),
                    priceBeforeDiscount: bloc
                            .favoriteData!.data[index].priceBeforeDiscount
                            .toString() +
                        LocaleKeys.rial.tr(),
                    image: bloc.favoriteData!.data[index].mainImage,
                    discount:
                        bloc.favoriteData!.data[index].discount.toString(),
                  ),
                );
              }
            }));
  }
}
