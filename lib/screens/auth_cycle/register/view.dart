import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/shared/router.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../shared/widgets/auth_header.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/choose_city.dart';
import '../../../shared/widgets/input.dart';
import '../../../shared/widgets/toast.dart';
import '../verify/view.dart';
import 'bloc/bloc.dart';
import 'cities_Data.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<RegisterBloc>()..add(GetCitiesEventStart());

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
                  title: LocaleKeys.helloAgain.tr(),
                  subTitle: LocaleKeys.loginNow.tr(),
                ),
                Input(
                  hint: LocaleKeys.userName.tr(),
                  imageName: 'ic_user.png',
                  controller: bloc.fullNameController,
                  type: TextInputType.text,
                ),
                Input(
                  hint: LocaleKeys.phoneNumber.tr(),
                  imageName: 'ic_phone.png',
                  isPhone: true,
                  controller: bloc.phoneController,
                  type: TextInputType.number,
                ),
                StatefulBuilder(builder: (context, setState) {
                  return Row(
                    children: [
                      Expanded(
                        child: Input(
                          hint: bloc.cityName ?? LocaleKeys.city.tr(),
                          isCitySelection: true,
                          onInputPress: () {
                            showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusDirectional.only(
                                    topEnd: Radius.circular(25.r),
                                    topStart: Radius.circular(25.r),
                                  ),
                                ),
                                builder: (context) => ChooseCityDialog(
                                      selectedCityId: bloc.cityId ?? "-1",
                                    )).then((value) {
                              if (value != null) {
                                var city = value as Cities;
                                bloc.cityId = city.id;
                                bloc.cityName = city.name;
                                setState(() {});
                              }
                            });
                          },
                          type: TextInputType.text,
                          isEnabled: false,
                          imageName:'ic_report.png',
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      (bloc.cityName != null ||
                              bloc.cityName == LocaleKeys.city.tr())
                          ? Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  bloc.cityName = null;
                                  bloc.cityId = null;
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          : const SizedBox.shrink()
                    ],
                  );
                }),
                Input(
                  hint: LocaleKeys.password.tr(),
                  imageName: 'ic_password.png',
                  controller: bloc.passwordController,
                  secure: true,
                ),
                Input(
                  hint: LocaleKeys.password.tr(),
                  imageName: 'ic_password.png',
                  controller: bloc.passwordConfirmController,
                  secure: true,
                ),
                BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is RegisterFailedState) {
                      Toast.show(state.error, context);
                    }
                    if (state is RegisterSuccessState) {
                      bloc.formKey.currentState!.reset();
                      MagicRouter.navigateTo(VerifyView(
                        phoneNumber: state.phoneNumber,
                      ));
                    }
                  },
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.all(8.r),
                      child: CustomButton(
                        isLoading: state is RegisterLoadingState,
                        pressed: () {
                          if (bloc.isDataValid(context)) {
                            bloc.add(RegisterEventStart());
                          }
                        },
                        fontSize: 20.sp,
                        text: LocaleKeys.register.tr(),
                      ),
                    );
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
