import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/shared/widgets/app_bar.dart';
import 'package:thimar_client/shared/const/colors.dart';
import '../../../generated/locale_keys.g.dart';
import 'bloc/bloc.dart';

class PrivacyPolicy extends StatelessWidget {
  PrivacyPolicy({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<PrivacyPolicyBloc>()
    ..add(GetPolicyEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (bloc.policyData == null) {
            return CircularProgressIndicator();
          } else {
            return Scaffold(
              appBar: AppBarComponent(
                title: LocaleKeys.privacyPolicy.tr(),
              ),
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.all(8.r),
                child: Html(data: '${bloc.policyData!.data.policy}', style: {
                  "p": Style(
                    color: AppColors.greyLite,
                    fontSize: FontSize(15.sp),
                  ),
                }),
              ),
            );
          }
        });
  }
}
