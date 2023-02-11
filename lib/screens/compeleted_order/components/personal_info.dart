import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../../generated/locale_keys.g.dart';
import '../../../shared/const/colors.dart';
import '../../my_account_pages/personal_info/bloc/bloc.dart';

class PersonalInfo extends StatelessWidget {
   PersonalInfo({Key? key}) : super(key: key);
  final blocProfile = KiwiContainer().resolve<ProfileBloc>()
    ..add(GetProfileEvent());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: blocProfile,
        builder: (context, state) {
          if (blocProfile.profileData == null) {
            return Text("");
          } else {
            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      "${LocaleKeys.name.tr()} : ",
                      style: TextStyle(
                          color: AppColors.green,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      blocProfile.profileData!.data.fullname,
                      style: TextStyle(
                          color: AppColors.green,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      "${LocaleKeys.phone.tr()} : ",
                      style: TextStyle(
                          color: AppColors.green,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      blocProfile.profileData!.data.phone,
                      style: TextStyle(
                          color: AppColors.green,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            );
          }
        });
  }
}
