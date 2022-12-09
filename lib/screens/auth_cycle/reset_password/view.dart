import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../shared/router.dart';
import '../../../shared/widgets/auth_header.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/have_account_or_not.dart';
import '../../../shared/widgets/input.dart';
import '../forget_password/view.dart';
import '../log_in/view.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                AuthHeader(
                  title: LocaleKeys.forgetPassword.tr(),
                  subTitle: LocaleKeys.enterNewPassword.tr(),
                ),
                Input(
                  hint:LocaleKeys.password.tr(),
                  imageName: 'ic_password.png',
                ),
                Input(
                  hint: LocaleKeys.password.tr(),
                  imageName: 'ic_password.png',
                ),
                Padding(
                  padding:  EdgeInsets.all(8.r),
                  child: CustomeButton(
                    pressed: () {
                      MagicRouter.navigateTo(ForgetPasswordView());
                    },
                    text:LocaleKeys.changePassword.tr(),
                  ),
                ),
                HaveAccountOrNot(
                  title:LocaleKeys.haveAccount.tr(),
                  actionTitle: LocaleKeys.login.tr(),
                  presses: () {
                    MagicRouter.navigateTo(LogInScreen());
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
