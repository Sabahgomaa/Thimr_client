import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/screens/nav_bar/view.dart';
import 'package:thimar_client/shared/core/cach_helper.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../shared/router.dart';
import '../../../shared/widgets/auth_header.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/have_account_or_not.dart';
import '../../../shared/widgets/input.dart';
import '../../../shared/widgets/text_button.dart';
import '../../../shared/widgets/toast.dart';
import '../forget_password/view.dart';
import '../register/view.dart';
import 'bloc/bloc.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final bloc = KiwiContainer().resolve<LogInBloc>()..init();

  @override
  void dispose() {
    super.dispose();
    bloc.clearFields();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: bloc.formLoginKey,
            child: Column(
              children: [
                AuthHeader(
                  title: LocaleKeys.helloAgain.tr(),
                  subTitle: LocaleKeys.loginNow.tr(),
                ),
                Input(
                  hint: LocaleKeys.phoneNumber.tr(),
                  imageName: 'ic_phone.png',
                  isPhone: true,
                  controller: bloc.phoneLoginController,
                  type: TextInputType.text,
                ),
                Input(
                  hint: LocaleKeys.password.tr(),
                  imageName: 'ic_password.png',
                  controller: bloc.passwordLoginController,
                  secure: true,
                ),
                //SizedBox(height: 5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      text: LocaleKeys.forgetPassword.tr(),
                      press: () {
                        MagicRouter.navigateTo(ForgetPasswordView());
                      },
                      fontSize: 21.sp,
                    )
                  ],
                ),
                BlocConsumer(
                  bloc: bloc,
                  listener: (context,  state) async {
                    if (state is LoginFailedState) {
                      Toast.show(state.msg.toString(), context);
                      // Fluttertoast.showToast(msg: state.error);
                    }
                    if (state is LoginSuccessState) {
                      Toast.show(LocaleKeys.loginSuccess.tr(), context);
                      await CacheHelper.setIfIsVisitor(false);
                      bloc.clearFields();
                      // bloc.formLoginKey.currentState!.reset();
                      MagicRouter.navigateTo(NavBarScreen());
                    }
                  },
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.all(8.r),
                      child: CustomButton(
                        isLoading: state is LoginLoadingState,
                        pressed: () {
                          if (bloc.phoneLoginController.text.isNotEmpty &&
                              bloc.passwordLoginController.text.isNotEmpty) {
                            bloc.add(LoginEventStart());
                          } else {
                            Toast.show(LocaleKeys.writeYourData.tr(), context);
                          }
                        },
                        text: LocaleKeys.login.tr(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomButton(
                  text: LocaleKeys.loginAsVisitor.tr(),
                  pressed: () async {
                    await CacheHelper.setIfIsVisitor(true);
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                HaveAccountOrNot(
                    title: LocaleKeys.noAccount.tr(),
                    actionTitle: LocaleKeys.register.tr(),
                    presses: () {
                      bloc.clearFields();
                      MagicRouter.navigateTo(RegisterView());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
