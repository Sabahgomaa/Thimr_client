import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/shared/router.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../shared/widgets/auth_header.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/input.dart';
import '../verify/view.dart';
import 'bloc/bloc.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<RegisterBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: bloc.formKey,
            child: Column(
              children: [
                AuthHeader(
                  title:LocaleKeys.helloAgain.tr(),
                  subTitle: LocaleKeys.loginNow.tr(),
                ),
                Input(
                  hint: LocaleKeys.userName.tr(),
                  imageName: 'ic_user.png',
                  controller: bloc.fullNameController,
                  type: TextInputType.text,
                ),
                Input(
                  hint: LocaleKeys.phoneNumber.tr(),
                  imageName: 'ic_phone.png',
                  isPhone: true,
                  controller: bloc.phoneController,
                  type: TextInputType.number,
                ),
              //  DroDownCities(),
                // Input(
                //   hint: 'المدينة',
                //   imageName: 'icon_report.png',
                // ),
                Input(
                  hint: LocaleKeys.password.tr(),
                  imageName: 'ic_password.png',
                  controller: bloc.passwordController,
                  secure: true,
                ),
                Input(
                  hint: LocaleKeys.password.tr(),
                  imageName: 'ic_password.png',
                  controller: bloc.passwordConfirmController,
                  secure: true,

                ),
                BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is RegisterFailedState) {
                      Fluttertoast.showToast(msg: state.error);
                    }
                    if (state is RegisterSuccessState) {
                      bloc.formKey.currentState!.reset();
                      MagicRouter.navigateTo(VerifyView(
                        phoneNumber: state.phoneNumber,
                      ));
                    }
                  },
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.all(8.r),
                      child: CustomeButton(
                        isLoading: state is RegisterLoadingState,
                        pressed: () {
                          if (bloc.formKey.currentState!.validate()) {
                            bloc.add(RegisterEventStart());
                          }
                        },
                        fontSize: 20.sp,
                        text: LocaleKeys.register.tr(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
