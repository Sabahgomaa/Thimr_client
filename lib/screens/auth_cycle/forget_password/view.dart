import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/generated/locale_keys.g.dart';
import 'package:thimar_client/screens/auth_cycle/forget_password/bloc/bloc.dart';
import '../../../shared/router.dart';
import '../../../shared/widgets/auth_header.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/input.dart';
import '../verify/view.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<ForgetPasswordBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthHeader(
                title: LocaleKeys.forgetPassword.tr(),
                subTitle: LocaleKeys.enterConnectedPhone.tr(),
              ),
              BlocConsumer(
                bloc: bloc,
                listener: (context, state) {
                  MagicRouter.navigateTo(
                    VerifyView(
                      phoneNumber: state,
                    ),
                  );
                },
                builder: (context, state) {
                  return Form(
                    key: bloc.formKey,
                    child: Column(
                      children: [
                        Input(
                          hint: LocaleKeys.phoneNumber.tr(),
                          imageName: 'ic_phone.png',
                          isPhone: true,
                          controller: bloc.phoneController,
                          type: TextInputType.number,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.r),
                          child: CustomeButton(
                            pressed: () {
                              if (bloc.formKey.currentState!.validate()) {
                                bloc.add(ForgetPasswordStart());
                              }
                            },
                            width: 343.w,
                            height: 60.h,
                            fontSize: 20.sp,
                            text: LocaleKeys.confirmPhoneNumber.tr(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
