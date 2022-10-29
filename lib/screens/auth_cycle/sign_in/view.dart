import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/router.dart';
import '../../../shared/widgets/auth_header.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/have_account_or_not.dart';
import '../../../shared/widgets/input.dart';
import '../../../shared/widgets/text_button.dart';
import '../sign_up/view.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                AuthHeader(
                    title: "مرحبا بك مرة اخرى",
                    subTitle: "يمكنك تسجيل الدخول الان"),
                Input(
                  hint: 'رقم الجوال',
                  imageName: 'icon_phone.png',
                  isPhone: true,
                ),
                Input(
                  hint: 'كلمة المرور',
                  imageName: 'icon_Unlock.png',
                ),
                //SizedBox(height: 5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomeTextButton(
                      text: 'نسيت كلمة المرور ؟',
                      function: () {},
                      fontSize: 21.sp,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomeButton(
                    pressed: () {
                      MagicRouter.navigateTo(SignUpView());
                    },
                    width: 343.w,
                    height: 60.h,
                    fontSize: 20.sp,
                    text: 'تسجيل الدخول',
                  ),
                ),
                HaveAccountOrNot(
                  title: 'ليس لديك حساب ؟',
                  actionTitle: 'تسجيل الأن',
                  presses: () {
                    MagicRouter.navigateTo(SignUpView());
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
