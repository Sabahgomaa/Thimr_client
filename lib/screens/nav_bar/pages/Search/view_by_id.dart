import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/screens/nav_bar/pages/Search/bloc/bloc.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../shared/const/colors.dart';
import '../home/widgets/item_product.dart';

class SearchByIdView extends StatefulWidget {
  final int? categoryId;

  final String? name;

  SearchByIdView({Key? key, this.name, this.categoryId}) : super(key: key);

  @override
  State<SearchByIdView> createState() => _SearchByIdViewState();
}

class _SearchByIdViewState extends State<SearchByIdView> {
  final bloc = KiwiContainer().resolve<SearchBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(Assets.images.back.path)),
        ),
        title: Text(
          widget.name!,
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            return Form(
              //key: bloc.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.r),
                    child: TextFormField(
                      autofocus: false,
                      cursorColor: AppColors.green,
                      onChanged: (data) {},
                      onFieldSubmitted: (data) {
                        bloc.searchByIdController = data;
                        bloc.add(GetSearchByIdEvent(id: widget.categoryId!));
                        print("${bloc.searchByIdController}");
                      },
                      //  controller: bloc.searchController,
                      decoration: InputDecoration(
                        hintText: LocaleKeys.searchOnWhatYouNeed.tr(),
                        filled: true,
                        fillColor: AppColors.greyLite.withOpacity(.1),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        hintStyle: TextStyle(
                            color: Color(0xffAFAFAF), fontSize: 15.sp),
                        prefixIcon: Container(
                          padding: const EdgeInsetsDirectional.only(
                              start: 18, end: 11, top: 10, bottom: 10),
                          child: Image.asset(
                            "assets/images/search_icon.png",
                            height: 15.h,
                            width: 15.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder(
                        bloc: bloc,
                        builder: (context, state) {
                          if (bloc.modelById == null) {
                            return SizedBox();
                          } else {
                            return bloc.modelById!.data.searchResult.isEmpty
                                ? Text("Not Found Result")
                                : GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: bloc
                                        .modelById!.data.searchResult.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 1.0,
                                      childAspectRatio: 163 / 230,
                                      mainAxisSpacing: 1.0,
                                    ),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        // onTap: () {
                                        //   MagicRouter.navigateTo(ShowProductScreen(
                                        //     id: bloc.productData!.data[index].id,
                                        //   ));
                                        // },
                                        child: ItemProduct(
                                          isCard: true,
                                          title: bloc.modelById!.data
                                              .searchResult[index].title,
                                          priceBeforeDiscount: bloc
                                                  .modelById!
                                                  .data
                                                  .searchResult[index]
                                                  .priceBeforeDiscount
                                                  .toString() +
                                              LocaleKeys.rial.tr(),
                                          price: bloc.modelById!.data
                                                  .searchResult[index].price
                                                  .toString() +
                                              LocaleKeys.rial.tr(),
                                          image: bloc.modelById!.data
                                              .searchResult[index].mainImage,
                                          id: bloc.modelById!.data
                                              .searchResult[index].id,
                                          discount: bloc.modelById!.data
                                              .searchResult[index].discount,
                                        ),
                                      );
                                    },
                                  );
                          }
                        }),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
