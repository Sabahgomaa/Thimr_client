import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/generated/locale_keys.g.dart';
import 'package:thimar_client/screens/auth_cycle/forget_password/bloc/bloc.dart';
import '../../../shared/router.dart';
import '../../../shared/widgets/auth_header.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/input.dart';
import '../../../shared/widgets/toast.dart';
import '../confirm_code/view.dart';

class ForgetPasswordView extends StatefulWidget {
  ForgetPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final bloc = KiwiContainer().resolve<ForgetPasswordBloc>();

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
          child: Column(
            children: [
              AuthHeader(
                title: LocaleKeys.forgetPassword.tr(),
                subTitle: LocaleKeys.enterConnectedPhone.tr(),
              ),
              Form(
                key: bloc.formKey,
                child: Column(
                  children: [
                    Input(
                      hint: LocaleKeys.phoneNumber.tr(),
                      imageName: 'ic_phone.png',
                      isPhone: true,
                      controller: bloc.phoneController,
                      type: TextInputType.number,
                    ),
                    BlocConsumer(
                      listener:  (context,  state) {
                        if (state is ForgetPasswordSuccessState) {
                          MagicRouter.navigateTo(ConfirmCodeView(
                            phone: bloc.phoneController.text.trim(),
                          ));
                          bloc.clearFiled();
                        } else if (state is ForgetPasswordFailedState) {
                          Toast.show(state.msg, context);
                        }
                      },
                      builder: (context, state) => Padding(
                        padding: EdgeInsets.all(8.r),
                        child: CustomButton(
                          isLoading: state is ForgetPasswordLoadingState,
                          pressed: () {
                            if (bloc.phoneController.text.isNotEmpty && bloc.formKey.currentState!.validate()) {
                              bloc.add(ForgetPasswordStart());
                            } else {
                              Toast.show(
                                  LocaleKeys.writeYourData.tr(), context);
                            }
                          },
                          fontSize: 20.sp,
                          text: LocaleKeys.confirmPhoneNumber.tr(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    // Center(
                    //   child: Padding(
                    //     padding: EdgeInsets.only(
                    //       bottom: 8.0.h,
                    //     ),
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         bloc.clearFiled();
                    //         MagicRouter.navigateTo(RegisterView());
                    //       },
                    //       child: Text.rich(TextSpan(children: [
                    //         TextSpan(
                    //           text: LocaleKeys.noAccount.tr(),
                    //           style: TextStyle(
                    //             fontSize: 15.sp,
                    //             height: 2.h,
                    //             color: AppColors.green,
                    //           ),
                    //         ),
                    //         TextSpan(
                    //           text: LocaleKeys.registerNow.tr(),
                    //           style: TextStyle(
                    //             fontSize: 18.sp,
                    //             height: 2.4.h,
                    //             color: AppColors.green,
                    //           ),
                    //         ),
                    //       ])),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
