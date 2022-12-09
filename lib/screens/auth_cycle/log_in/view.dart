import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/screens/nav_bar/view.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../shared/router.dart';
import '../../../shared/widgets/auth_header.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/have_account_or_not.dart';
import '../../../shared/widgets/input.dart';
import '../../../shared/widgets/text_button.dart';
import '../forget_password/view.dart';
import '../register/view.dart';
import 'bloc/bloc.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<LogInBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: bloc.formLoginKey,
            child: Column(
              children: [
                AuthHeader(
                  title: LocaleKeys.helloAgain.tr(),
                  subTitle: LocaleKeys.loginNow.tr(),
                ),
                Input(
                  hint: LocaleKeys.phoneNumber.tr(),
                  imageName: 'ic_phone.png',
                  isPhone: true,
                  controller: bloc.phoneLoginController,
                  type: TextInputType.text,
                ),
                Input(
                  hint: LocaleKeys.password.tr(),
                  imageName: 'ic_password.png',
                  controller: bloc.passwordLoginController,
                  secure: true,
                ),
                //SizedBox(height: 5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomeTextButton(
                      text: LocaleKeys.forgetPassword.tr(),
                      function: () {
                        MagicRouter.navigateTo(ForgetPasswordView());
                      },
                      fontSize: 21.sp,
                    )
                  ],
                ),
                BlocConsumer(
                  bloc: bloc,
                  listener: (BuildContext context, Object? state) {
                    if (state is LoginFailedState) {
                      Fluttertoast.showToast(msg: state.error);
                    }
                    if (state is LoginSuccessState) {
                      bloc.formLoginKey.currentState!.reset();
                      MagicRouter.navigateTo(HomeView());
                    }
                  },
                  builder: (BuildContext context, state) {
                    return Padding(
                      padding: EdgeInsets.all(8.r),
                      child: CustomeButton(
                        isLoading: state is LoginLoadingState,
                        pressed: () {
                          if (bloc.formLoginKey.currentState!.validate()) {
                            bloc.add(LoginEventStart());
                          }
                        },
                        text: LocaleKeys.login.tr(),
                      ),
                    );
                  },
                ),
                HaveAccountOrNot(
                    title: LocaleKeys.noAccount.tr(),
                    actionTitle: LocaleKeys.register.tr(),
                    presses: () {
                      MagicRouter.navigateTo(RegisterView());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
