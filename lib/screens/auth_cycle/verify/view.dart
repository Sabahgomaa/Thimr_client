import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thimar_client/generated/locale_keys.g.dart';
import 'package:thimar_client/screens/auth_cycle/log_in/view.dart';
import '../../../shared/const/colors.dart';
import '../../../shared/core/cach_helper.dart';
import '../../../shared/router.dart';
import '../../../shared/widgets/auth_header.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/have_account_or_not.dart';
import '../../nav_bar/view.dart';
import 'bloc/bloc.dart';

class VerifyView extends StatelessWidget {
  final phoneNumber;

  VerifyView({Key? key, required this.phoneNumber}) : super(key: key);
  final bloc = KiwiContainer().resolve<VerifyBloc>();

  @override
  Widget build(BuildContext context) {
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
    final controller = CountdownTimerController(endTime: endTime, onEnd: () {});
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: bloc.formKey,
            child: Column(
              children: [
                AuthHeader(
                  title: LocaleKeys.activeAccount.tr(),
                  subTitle:
                      LocaleKeys.enterOTPCode.tr() + "${CacheHelper.getPhone()}"
                ),
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
                          borderRadius: BorderRadius.circular(10.r),
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
                        bloc.codeController = submitedCode;
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
                    onEnd: () {},
                    endTime: endTime,
                  ),
                ),
                BlocConsumer(
                  bloc: bloc,
                  listener: (BuildContext context, Object? state) {
                    if (state is VerifyFailedState) {
                      Fluttertoast.showToast(msg: state.error);
                    }
                    if (state is VerifySuccessState) {
                      bloc.formKey.currentState!.reset();
                      MagicRouter.navigateTo(HomeView());
                    }
                  },
                  builder: (BuildContext context, state) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomeButton(
                        isLoading: state is VerifyLoadingState,
                        pressed: () {
                          if (bloc.formKey.currentState!.validate()) {
                            bloc.add(
                                VerifyEventStart(phoneNumber: phoneNumber));
                          }
                        },
                        fontSize: 20.sp,
                        text: LocaleKeys.confirmCode.tr(),
                      ),
                    );
                  },
                ),
                HaveAccountOrNot(
                  title: LocaleKeys.haveAccount.tr(),
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
