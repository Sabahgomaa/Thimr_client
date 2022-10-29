import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/router.dart';
import '../../../shared/widgets/auth_header.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/input.dart';
import '../active_account/view.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

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
                    subTitle: "أدخل رقم الجوال المرتبط بحسابك"),
                Input(
                  hint: 'رقم الجوال',
                  imageName: 'icon_phone.png',
                  isPhone: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomeButton(
                    pressed: () {
                      MagicRouter.navigateTo(
                        ActiveAccountView(),
                      );
                    },
                    width: 343.w,
                    height: 60.h,
                    fontSize: 20.sp,
                    text: 'تأكيد رقم الجوال',
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
