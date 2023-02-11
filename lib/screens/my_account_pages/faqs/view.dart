import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/generated/locale_keys.g.dart';

import 'package:thimar_client/shared/widgets/app_bar.dart';

import '../../../shared/const/colors.dart';
import 'boc/bloc.dart';

class FAQsView extends StatelessWidget {
  FAQsView({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<FAQSBloc>()..add(GetFAQsEvent());

  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (bloc.faQsData == null) {
            return CircularProgressIndicator();
          } else {
            return Scaffold(
              appBar: AppBarComponent(
                title:LocaleKeys.knownQuestions.tr(),
              ),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: ExpansionPanelList.radio(
                  children: bloc.faQsData!.data
                      .map((item) => ExpansionPanelRadio(
                            value: bloc.faQsData!.data.length,
                            headerBuilder: (context, isExpanded) => ListTile(
                              title: Text(
                                item.question,
                                style: TextStyle(
                                  color: AppColors.green,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            body: ListTile(
                              title: Text(
                                item.answer,
                                style: TextStyle(
                                  color: AppColors.greyLite,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            );
          }
        });
  }
}
