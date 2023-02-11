import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../shared/const/colors.dart';
import '../home/widgets/item_product.dart';
import '../home/widgets/main_app_bar.dart';
import 'bloc/bloc.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<SearchBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(),
        body: BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              return Form(
                key: bloc.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: false,
                      cursorColor: AppColors.green,
                      onChanged: (data) {},
                      onFieldSubmitted: (data) {
                        bloc.searchController = data;
                        bloc.add(GetSearchEvent());
                        print("${bloc.searchController}");
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
                          child: SvgPicture.asset(
                            "assets/images/svg_images/search.svg",
                            height: 15.h,
                            width: 15.w,
                          ),
                        ), 
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder(
                          bloc: bloc,
                          builder: (context, state) {
                            if (bloc.model == null) {
                              return SizedBox();
                            } else {
                              return bloc.model!.data.searchResult.isEmpty
                                  ? Text("Not Found Result")
                                  : GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          bloc.model!.data.searchResult.length,
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
                                            title: bloc.model!.data
                                                .searchResult[index].title,
                                            priceBeforeDiscount: bloc
                                                    .model!
                                                    .data
                                                    .searchResult[index]
                                                    .priceBeforeDiscount
                                                    .toString() +
                                                LocaleKeys.rial.tr(),
                                            price: bloc.model!.data
                                                    .searchResult[index].price
                                                    .toString() +
                                                LocaleKeys.rial.tr(),
                                            image: bloc.model!.data
                                                .searchResult[index].mainImage,
                                            id: bloc.model!.data
                                                .searchResult[index].id,
                                            discount: bloc.model!.data
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
            }));
  }
}
