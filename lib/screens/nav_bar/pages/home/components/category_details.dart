// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/bloc/bloc.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/widgets/search_bar.dart';
import '../bloc/models/categories_details_model.dart';
import '../widgets/item_product.dart';

class CategoriesDetailsScreen extends StatefulWidget {
  int? categoryId;
  String? name;

  CategoriesDetailsScreen({Key? key, this.categoryId, this.name})
      : super(key: key);

  @override
  State<CategoriesDetailsScreen> createState() =>
      _CategoriesDetailsScreenState();
}

class _CategoriesDetailsScreenState extends State<CategoriesDetailsScreen> {
  CategoryDetails? categoryDetails;

  final bloc = KiwiContainer().resolve<HomeBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(GetCategoriesDetailsEvent(id: widget.categoryId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {}, child: Image.asset(Assets.images.back.path)),
        ),
        title: Text(
          widget.name!,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.r),
              child: SearchBar(),
            ),
            BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (bloc.categoriesDetailsData == null) {
                    return CircularProgressIndicator();
                  } else {
                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: bloc.categoriesDetailsData!.data.length,
                      gridDelegate:
                           SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 163.w / 215.h,
                        crossAxisCount: 2,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 1.0,
                      ),
                      itemBuilder: (context, index) => ItemProduct(
                        title: bloc.categoriesDetailsData!.data[index].title,
                        priceBeforeDiscount: bloc.categoriesDetailsData!
                            .data[index].priceBeforeDiscount
                            .toString(),
                        price: bloc.categoriesDetailsData!.data[index].price
                            .toString(),
                        image:
                            bloc.categoriesDetailsData!.data[index].mainImage,
                        discount: bloc.categoriesDetailsData!.data[index].discount.toString(),
                        id: bloc.categoriesDetailsData!.data[index].id,

                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
