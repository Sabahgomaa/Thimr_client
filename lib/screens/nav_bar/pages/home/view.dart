import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/widgets/search_bar.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/widgets/slider.dart';
import 'package:thimar_client/shared/router.dart';

import '../../../../generated/locale_keys.g.dart';
import '../Search/view.dart';
import 'widgets/main_app_bar.dart';
import 'components/list_category.dart';
import 'components/list_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                MagicRouter.navigateTo(SearchScreen());
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
            ListProducts(),
          ],
        ),
      ),
    );
  }
}
