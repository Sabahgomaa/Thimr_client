import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../shared/router.dart';
import '../../../shared/widgets/auth_header.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/have_account_or_not.dart';
import '../../../shared/widgets/input.dart';
import '../../../shared/widgets/toast.dart';
import '../log_in/view.dart';
import 'bloc/bloc.dart';

class ResetPasswordView extends StatefulWidget {
  final String code;
  final String phone;

  const ResetPasswordView({Key? key, required this.code, required this.phone})
      : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final bloc = KiwiContainer().resolve<ResetPasswordBloc>();

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
            child: Column(
              children: [
                AuthHeader(
                  title: LocaleKeys.forgetPassword.tr(),
                  subTitle: LocaleKeys.enterNewPassword.tr(),
                ),
                Input(
                  hint: LocaleKeys.password.tr(),
                  imageName: 'ic_password.png',
                ),
                Input(
                  hint: LocaleKeys.confirmPassword.tr(),
                  imageName: 'ic_password.png',
                ),
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: BlocConsumer(
                    listener: (BuildContext context, Object? state) {
                      if (state is ResetPasswordSuccessState) {
                        MagicRouter.navigateTo(
                          LogInScreen(),
                        );
                      } else if (state is ResetPasswordFailedState) {
                        Toast.show(state.msg!, context);
                      }
                    },
                    builder: (BuildContext context, state) {
                      return CustomButton(
                        isLoading: state is ResetPasswordLoadingState,
                        pressed: () {
                          bloc.add(
                            ResetPasswordEvent(
                              code: widget.code,
                              phone: widget.phone,
                            ),
                          );
                        },
                        text: LocaleKeys.changePassword.tr(),
                      );
                    },
                  ),
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
