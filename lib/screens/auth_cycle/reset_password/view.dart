import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/router.dart';
import '../../../shared/widgets/auth_header.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/have_account_or_not.dart';
import '../../../shared/widgets/input.dart';
import '../forget_password/view.dart';
import '../sign_in/view.dart';

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
                    title: "نسيت كلمة المرور",
                    subTitle: "أدخل كلمة المرور الجديدة"),
                Input(
                  hint: 'كلمة المرور',
                  imageName: 'icon_Unlock.png',
                ),
                Input(
                  hint: 'كلمة المرور',
                  imageName: 'icon_Unlock.png',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomeButton(
                    pressed: () {
                      MagicRouter.navigateTo(ForgetPasswordView());
                    },
                    width: 343.w,
                    height: 60.h,
                    fontSize: 20.sp,
                    text: 'تغيير كلمة المرور',
                  ),
                ),
                HaveAccountOrNot(
                  title: 'لديك حساب بالفعل ؟',
                  actionTitle: 'تسجيل الدخول',
                  presses: () {
                    MagicRouter.navigateTo(SignInView());
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
