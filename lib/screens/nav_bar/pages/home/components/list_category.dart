import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/bloc/bloc.dart';
import '../widgets/item_category.dart';

class ListCategories extends StatelessWidget {
  ListCategories({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<HomeBloc>()..add(GetCategoriesEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      // buildWhen: (previous, current) =>
      // previous. != current!.HomeStates,
      bloc: bloc,
      builder: (context, state) {
        if (bloc.categoriesModel == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container(
            height: 120.h,
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
