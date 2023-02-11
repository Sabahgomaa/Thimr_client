import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/text_button.dart';

import '../../../generated/locale_keys.g.dart';
import '../../../shared/const/colors.dart';
import '../../../shared/widgets/auth_header.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/have_account_or_not.dart';
import '../../../shared/widgets/toast.dart';
import '../log_in/view.dart';
import '../reset_password/view.dart';
import 'bloc/bloc.dart';

class ConfirmCodeView extends StatefulWidget {
  final String phone;

  const ConfirmCodeView({Key? key, required this.phone}) : super(key: key);

  @override
  State<ConfirmCodeView> createState() => _ConfirmCodeViewState();
}

class _ConfirmCodeViewState extends State<ConfirmCodeView> {
  final bloc = KiwiContainer().resolve<ConfirmCodeBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AuthHeader(
            title: LocaleKeys.activeAccount.tr(),
            subTitle: LocaleKeys.enterOTPCode.tr(),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: "+966${widget.phone}",
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
                  ],
                ),
              ),
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
                  selectedFillColor: Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                // backgroundColor: Colors.white,
                enableActiveFill: true,
                controller: bloc.codeController,
                onCompleted: ((submittedCode) {
                  bloc.add(ConfirmCodeEvent(phone: widget.phone));
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
              if (state is ConfirmCodeSuccessState) {
                MagicRouter.navigateTo(
                  ResetPasswordView(phone: widget.phone, code: bloc.codeController.text),
                );
              } else if (state is ConfirmCodeFailedState) {
                Toast.show(state.msg!, context);
              }
            },
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.all(8.r),
                child: CustomButton(
                  isLoading: state is ConfirmCodeLoadingState,
                  pressed: () {
                    if (bloc.codeController.text.isNotEmpty) {
                      bloc.add(ConfirmCodeEvent(
                        phone: widget.phone,
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
              color: AppColors.grey,
            ),
          ),
          Text(
            LocaleKeys.youCanSendCodeAgainAfter.tr(),
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.grey,
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
                  ringColor: AppColors.whiteApp,
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
          CustomTextButton(
            text: LocaleKeys.resend.tr(),
            press: () {
              bloc.finishTimer = false;
              setState(() {});
              bloc.controller.restart();
            },
            fontSize: 15.sp,
          ),
          HaveAccountOrNot(
            title: LocaleKeys.haveAccount.tr(),
            actionTitle: LocaleKeys.login.tr(),
            presses: () {
              MagicRouter.navigateTo(LogInScreen());
            },
          ),
        ],
      )),
    );
  }
}
