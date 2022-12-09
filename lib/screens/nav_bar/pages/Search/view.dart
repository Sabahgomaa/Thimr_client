import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../shared/const/colors.dart';
import '../home/widgets/item_product.dart';
import '../home/widgets/main_app_bar.dart';
import 'bloc/bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<SearchBloc>()..add(GetSearchEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: BlocConsumer(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (bloc.model == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Form(
              key: bloc.formKey,
              child: Column(
                children: [
                  TextFormField(
                    autofocus: false,
                    cursorColor: AppColors.green,
                    onChanged: (data){

                    },
                    onFieldSubmitted: (data){
                      bloc.searchController=data;
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
                      hintStyle:
                          TextStyle(color: Color(0xffAFAFAF), fontSize: 15.sp),
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
                  Expanded(
                    child: BlocBuilder(
                      bloc: bloc,
                        builder: (context, state) {
                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: bloc.model!.data.searchResult.length,
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
                              title: bloc.model!.data.searchResult[index].title,
                              priceBeforeDiscount: bloc.model!.data
                                      .searchResult[index].priceBeforeDiscount
                                      .toString() +
                                  LocaleKeys.rial.tr(),
                              price: bloc.model!.data.searchResult[index].price
                                      .toString() +
                                  LocaleKeys.rial.tr(),
                              image: bloc
                                  .model!.data.searchResult[index].mainImage,
                              id: bloc.model!.data.searchResult[index].id,
                              discount: bloc
                                  .model!.data.searchResult[index].discount
                                  .toString(),
                              ammount: bloc
                                  .model!.data.searchResult[index].amount
                                  .toString(),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
