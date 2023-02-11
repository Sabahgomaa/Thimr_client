import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/shared/widgets/app_bar.dart';
import 'package:thimar_client/shared/const/colors.dart';

import 'package:thimar_client/shared/widgets/button.dart';
import 'package:thimar_client/shared/widgets/input.dart';
import 'package:thimar_client/shared/widgets/loading_progress.dart';

import '../../../generated/locale_keys.g.dart';
import 'bloc/bloc.dart';

class PersonalView extends StatelessWidget {
  PersonalView({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<ProfileBloc>()..add(GetProfileEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: LocaleKeys.personalInfo.tr(),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (bloc.profileData == null) {
            return LoadingProgress();
          } else {
            return ListView(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Column(
                      children: [
                        Container(
                          height: 83.h,
                          width: 88.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Image.network(
                              bloc.profileData!.data.image,
                              // Assets.images.photoProfile.path,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.r),
                          child: Text(
                            bloc.profileData!.data.fullname,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.r),
                          child: Text(
                            bloc.profileData!.data.phone,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.greyLite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Input(
                      autofocus: false,
                      labelText: LocaleKeys.userName.tr(),
                      imageName: 'user.png',
                      controller: bloc.fullNameController,
                    ),
                    Input(
                      autofocus: false,
                      isPhone: true,
                      labelText: LocaleKeys.phoneNumber.tr(),
                      imageName: 'phone.png',
                      controller: bloc.phoneController,
                    ),
                    Input(
                      autofocus: false,
                      labelText: LocaleKeys.city.tr(),
                      imageName: 'location.png',
                      // controller: bloc.profileData!.data.city,
                    ),
                    Input(
                      autofocus: false,
                      labelText: LocaleKeys.password.tr(),
                      imageName: 'location.png',
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding:EdgeInsets.only(left: 8.r,right:16.r,top: 8.r,bottom: 15.r ),
        child: CustomButton(
          pressed: () {},
          width: 345.w,
          height: 60.h,
          fontSize: 20.sp,

          text: LocaleKeys.editDetails.tr(),
        ),
      ),
    );
  }
}
