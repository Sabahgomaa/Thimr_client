import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/locale_keys.g.dart';
import '../../../shared/const/colors.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/input_without_image.dart';

class FormAddressesInput extends StatelessWidget {
  const FormAddressesInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: bloc.formKey,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(4.r),
          child: Stack(alignment: Alignment.centerLeft, children: [
            Container(
              height: 52.h,
              width: 360.w,
              decoration: BoxDecoration(
                // +
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 15.r, right: 8.r),
                child: Text(
                  LocaleKeys.typeOfAddress.tr(),
                  style: TextStyle(
                    color: AppColors.greyLite,
                    fontSize: 15.sp,
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 40.h,
                width: 144.w,
                child: DefaultTabController(
                  length: 2,
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(
                        5.r,
                      ),
                      border: Border.all(color: AppColors.green),
                    ),
                    labelStyle: TextStyle(
                      fontSize: 15.sp,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelStyle: TextStyle(
                      fontSize: 15.sp,
                    ),
                    unselectedLabelColor: AppColors.grey,
                    tabs: [
                      Tab(
                        text: 'المنزل',
                      ),
                      Tab(
                        text: 'العمل',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
        Padding(
          padding: EdgeInsets.all(4.r),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            //color: Colors.white,
            child: InputWithoutImage(
              label: LocaleKeys.phoneNumber.tr(),
              type: TextInputType.phone,
              // controller: bloc.phoneController,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(4.r),
          child: Container(
            color: Colors.white,
            child: InputWithoutImage(
              label: LocaleKeys.description.tr(),
              type: TextInputType.text,
              // controller: bloc.contentController,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30.r),
          child: CustomButton(
            text: LocaleKeys.addAddress.tr(),
            fontSize: 15.sp,
            textColor: AppColors.whiteApp,
            pressed: () {
              // bloc.add(ContactUsEvent());
            },
            //width: 312.w,
            height: 54.h,
          ),
        ),
      ]),
    );
  }
}
