import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/generated/locale_keys.g.dart';
import 'package:thimar_client/screens/my_account_pages/about_app/bloc/bloc.dart';
import 'package:thimar_client/shared/const/colors.dart';

import '../components/app_bar.dart';

class AboutApp extends StatelessWidget {
  AboutApp({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<AboutAppBloc>()..add(GetAboutAppEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (bloc.aboutData == null) {
            return CircularProgressIndicator();
          } else {
            return Scaffold(
              appBar: AppBarComponent(title: LocaleKeys.aboutApp.tr()),
              backgroundColor: Colors.white,
              body: ListView(
                children: [
                  Container(
                    height: 158.h,
                    width: 160.w,
                    child: Image.asset(Assets.images.logoApp.path),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child:
                          Html(data: '${bloc.aboutData!.data.about}', style: {
                        "p": Style(
                          color: AppColors.greyLite,
                          fontSize: FontSize(15.sp),
                        ),
                      }),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
