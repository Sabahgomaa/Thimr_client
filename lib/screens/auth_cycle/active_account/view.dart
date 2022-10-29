import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../shared/const/colors.dart';
import '../../../shared/router.dart';
import '../../../shared/widgets/auth_header.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/have_account_or_not.dart';
import '../sign_in/view.dart';

class ActiveAccountView extends StatelessWidget {
  const ActiveAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
    void onEnd() {
      print('onEnd');
    }
    CountdownTimerController controller =
        CountdownTimerController(endTime: endTime, onEnd: onEnd);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                AuthHeader(
                    title: "تفعيل الحساب",
                    subTitle:
                        "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال"),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: PinCodeTextField(
                      appContext: context,
                      autoFocus: true,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      animationType: AnimationType.scale,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 60.h,
                          fieldWidth: 70.75.w,
                          borderWidth: 1,
                          activeColor: AppColors.green,
                          inactiveColor: AppColors.green.withOpacity(.5),
                          inactiveFillColor: Colors.white,
                          activeFillColor: AppColors.green,
                          selectedColor: AppColors.green.withOpacity(.5),
                          selectedFillColor: Colors.white),
                      animationDuration: Duration(milliseconds: 300),
                      // backgroundColor: Colors.white,
                      enableActiveFill: true,
                      onCompleted: ((submitedCode) {
                        print('Completed');
                      }),
                      onChanged: (String value) {
                        print(value);
                      },
                      length: 4,
                    ),
                  ),
                ),
                Center(
                  child: CountdownTimer(
                    controller: controller,
                    onEnd: onEnd,
                    endTime: endTime,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomeButton(
                    pressed: () {},
                    width: 343.w,
                    height: 60.h,
                    fontSize: 20.sp,
                    text: 'تأكيد الكود',
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
