import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/router.dart';
import '../../../shared/widgets/auth_header.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/input.dart';
import '../reset_password/view.dart';


class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                AuthHeader(
                    title: "مرحبا بك مرة أخرى",
                    subTitle: "يمكنك تسجيل حساب جديد الأن"),
                Input(
                  hint: 'اسم المستخدم',
                  imageName: 'icon_User.png',
                ),
                Input(
                  hint: 'رقم الجوال',
                  imageName: 'icon_phone.png',
                  isPhone: true,
                ),
                Input(
                  hint: 'المدينة',
                  imageName: 'icon_report.png',
                ),
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
                      MagicRouter.navigateTo(ResetPasswordView());
                    },
                    width: 343.w,
                    height: 60.h,
                    fontSize: 20.sp,
                    text: 'تسجيل',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
