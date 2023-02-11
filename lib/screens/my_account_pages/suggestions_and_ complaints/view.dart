import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/shared/widgets/app_bar.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/widgets/button.dart';
import 'package:thimar_client/shared/widgets/input_without_image.dart';
import 'package:thimar_client/shared/widgets/toast.dart';
import '../../../generated/locale_keys.g.dart';
import 'bloc/bloc.dart';

class SuggestionsAndComplaints extends StatelessWidget {
  SuggestionsAndComplaints({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<SuggestionsAndComplaintsBloc>()
    ..add(SuggestionsAndComplaintsEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: LocaleKeys.suggestions.tr(),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(8.r),
        child: Form(
          key: bloc.formKey,
          child: Container(
            height: 400.h,
            child: Column(
              children: [
                InputWithoutImage(
                  label: LocaleKeys.name.tr(),
                  controller: bloc.fullNameController,
                  type: TextInputType.name,
                ),
                SizedBox(
                  height: 5.h,
                ),
                InputWithoutImage(
                  label: LocaleKeys.phoneNumber2.tr(),
                  controller: bloc.phoneController,
                  type: TextInputType.phone,
                ),
                SizedBox(
                  height: 5.h,
                ),
                InputWithoutImage(
                  label: LocaleKeys.subject.tr(),
                  controller: bloc.contentController,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 5.h,
                ),
                BlocConsumer(
                  bloc: bloc,
                  listener: ( context, state) {
                    if (state is SuggestionsAndComplaintsFailedState) {
                      Toast.show(state.msg.toString(), context);
                     // Fluttertoast.showToast(msg: state.error);
                    }
                    if (state is SuggestionsAndComplaintsSuccessState) {
                      bloc.formKey.currentState!.reset();
                      Toast.show(state.msg.toString(), context);
                      //Fluttertoast.showToast(msg: state.msg);
                    }
                  },
                  builder: (context, state) => Padding(
                    padding: EdgeInsets.all(8.r),
                    child: CustomButton(
                        text: LocaleKeys.send.tr(),
                        fontSize: 15.sp,
                        textColor: AppColors.whiteApp,
                        pressed: () {
                          if (bloc.formKey.currentState!.validate()) {
                            bloc.add(SuggestionsAndComplaintsEvent());
                          }
                        },
                        width: 312.w,
                        height: 54.h),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
