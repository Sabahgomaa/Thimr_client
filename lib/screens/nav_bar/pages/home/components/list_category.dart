import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/bloc/bloc.dart';
import 'package:thimar_client/shared/widgets/loading_progress.dart';
import '../widgets/item_category.dart';

class ListCategories extends StatelessWidget {
  ListCategories({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<HomeBloc>()..add(GetCategoriesEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      buildWhen: (previous, current) =>
      current is GetCategoriesLoadingState ||
          current is GetCategoriesSuccessState,
      builder: (context, state) {
        if (state is GetCategoriesLoadingState) {
          return LoadingProgress();
        } else {
          return bloc.categoriesModel == null
              ? Center(
                  child: Text(
                    "",
                    style: TextStyle(),
                  ),
                )
              : Container(
                  height: 150.h,
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
