import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/bloc/bloc.dart';
import 'item_category.dart';

class ListCategories extends StatelessWidget {
  ListCategories({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<HomeBloc>()..add(GetCategoriesEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (bloc.categoriesModel == null) {
          return CircularProgressIndicator();
        } else {
          return Container(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: bloc.categoriesModel!.categories.length,
              itemBuilder: (context, index) {
                return ItemCategory(
                  model: bloc.categoriesModel!.categories[index],
                );
              },
            ),
          );
        }
      },
    );
  }
}
