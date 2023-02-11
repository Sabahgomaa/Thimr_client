import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thimar_client/generated/locale_keys.g.dart';
import 'package:thimar_client/screens/auth_cycle/log_in/view.dart';
import 'package:thimar_client/shared/widgets/toast.dart';
import '../../../shared/const/colors.dart';
import '../../../shared/router.dart';
import '../../../shared/widgets/auth_header.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/have_account_or_not.dart';
import '../../../shared/widgets/text_button.dart';
import '../../nav_bar/view.dart';
import '../forget_password/bloc/bloc.dart';
import 'bloc/bloc.dart';

class VerifyView extends StatefulWidget {
  final phoneNumber;
  final bool fromLogin;

  VerifyView({Key? key, required this.phoneNumber, this.fromLogin = false})
      : super(key: key);

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  final bloc = KiwiContainer().resolve<VerifyBloc>();
  final forgetPasswordBloc = KiwiContainer().resolve<ForgetPasswordBloc>();

  @override
  void initState() {
    super.initState();
    if (widget.fromLogin) {
      forgetPasswordBloc.phoneNumberText = widget.phoneNumber;
      forgetPasswordBloc.add(ForgetPasswordStart());
      // bloc.finishTimer = false;
      // setState(() {});
      // bloc.controller.restart();
    }
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

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
                  title: LocaleKeys.activeAccount.tr(),
                  subTitle: LocaleKeys.enterOTPCode.tr(),
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.r),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "+966${widget.phoneNumber}",
                          style: TextStyle(
                              fontSize: 16.sp,
                              height: 2.h,
                              color: const Color(0xff707070))),
                      TextSpan(
                          text: LocaleKeys.changePhoneNumber.tr(),
                          style: TextStyle(
                              fontSize: 16.sp,
                              height: 2.1.h,
                              color: AppColors.green,
                              decorationThickness: 15.h,
                              decoration: TextDecoration.underline)),
                    ])),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Container(
                    child: PinCodeTextField(
                      appContext: context,
                      autoFocus: true,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      blinkWhenObscuring: true,
                      obscureText: false,
                      animationType: AnimationType.scale,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10.w),
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
                      controller: bloc.codeController,
                      onCompleted: ((submittedCode) {
                        bloc.add(
                            VerifyEventStart(phoneNumber: widget.phoneNumber));
                      }),
                      onChanged: (String value) {
                        bloc.currentText = value;
                        debugPrint(value);
                      },
                      length: 4,
                    ),
                  ),
                ),
                BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is VerifyFailedState) {
                      Toast.show(state.msg.toString(), context);
                    }
                    if (state is VerifySuccessState) {
                      Toast.show(LocaleKeys.confirmCodeSuccess.tr(), context);
                      bloc.formKey.currentState!.reset();
                      MagicRouter.navigateTo(NavBarScreen());
                    }
                  },
                  builder: (BuildContext context, state) {
                    return Padding(
                      padding: EdgeInsets.all(8.r),
                      child: CustomButton(
                        isLoading: state is VerifyLoadingState,
                        pressed: () {
                          if (bloc.codeController.text.isNotEmpty) {
                            bloc.add(VerifyEventStart(
                              phoneNumber: widget.phoneNumber,
                            ));
                          } else {
                            Toast.show(LocaleKeys.writeYourData.tr(), context);
                          }
                        },
                        fontSize: 20.sp,
                        text: LocaleKeys.confirmCode.tr(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  LocaleKeys.notHaveCode.tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    height: 3.h,
                    color: const Color(0xff707070),
                  ),
                ),
                Text(
                  LocaleKeys.youCanSendCodeAgainAfter.tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xff707070),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                bloc.finishTimer
                    ? const SizedBox.shrink()
                    : CircularCountDownTimer(
                        duration: 30,
                        initialDuration: 0,
                        controller: bloc.controller,
                        width: 66.w,
                        height: 66.h,
                        ringColor: const Color(0xffD8D8D8),
                        fillColor: AppColors.green,
                        backgroundColor: Colors.transparent,
                        strokeWidth: 3.0,
                        strokeCap: StrokeCap.round,
                        textStyle: TextStyle(
                          fontSize: 21.sp,
                          height: 2.4.h,
                          color: AppColors.green,
                        ),
                        textFormat: CountdownTextFormat.MM_SS,
                        isReverse: true,
                        isTimerTextShown: true,
                        autoStart: true,
                        onComplete: () {
                          setState(() {
                            bloc.finishTimer = true;
                          });
                        },
                      ),
                BlocConsumer(
                    bloc: forgetPasswordBloc,
                    listener: (context, state) {
                      if (state is ForgetPasswordSuccessState) {
                        Toast.show(LocaleKeys.codeSent.tr(), context);
                      }
                      if (state is ForgetPasswordFailedState) {
                        Toast.show(state.msg, context);
                      }
                    },
                    builder: (context, state) {
                      return CustomTextButton(
                        isLoading: state is ForgetPasswordLoadingState,
                        text: LocaleKeys.resend.tr(),
                        press: () {
                          forgetPasswordBloc.phoneNumberText =
                              widget.phoneNumber;
                          forgetPasswordBloc.add(ForgetPasswordStart());
                          bloc.finishTimer = false;
                          setState(() {});
                          bloc.controller.restart();
                        },
                        fontSize: 15.sp,
                      );
                    }),
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
