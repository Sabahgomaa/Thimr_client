import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:share_plus/share_plus.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/screens/my_account_pages/about_app/view.dart';
import 'package:thimar_client/screens/my_account_pages/addresses/view.dart';
import 'package:thimar_client/screens/my_account_pages/contact_us/view.dart';
import 'package:thimar_client/screens/my_account_pages/payments/view.dart';
import 'package:thimar_client/screens/my_account_pages/personal_info/view.dart';
import 'package:thimar_client/screens/my_account_pages/privacy_policy/view.dart';
import 'package:thimar_client/screens/my_account_pages/suggestions_and_%20complaints/view.dart';
import 'package:thimar_client/shared/core/cach_helper.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../shared/const/colors.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../auth_cycle/log_in/view.dart';
import '../../../my_account_pages/Wallet/view.dart';
import '../../../my_account_pages/faqs/view.dart';
import '../../../my_account_pages/personal_info/bloc/bloc.dart';
import 'bloc/bloc.dart';
import 'components/item_my_account.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final blocLogout = KiwiContainer().resolve<LogoutBloc>();
  final blocProfile = KiwiContainer().resolve<ProfileBloc>()
    ..add(GetProfileEvent());
  final deviceToken = FirebaseMessaging.instance.getToken();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            BlocBuilder(
              bloc: blocProfile,
              builder: (BuildContext context, state) {
                return Container(
                  height: 217.h,
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    // border: Border.all(color: AppColors.greyLite),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 15.r, top: 15.r),
                            child: Text(
                              LocaleKeys.my_account.tr(),
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.r),
                            child: Container(
                              height: 71.h,
                              width: 76.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: Image.network(
                                  blocProfile.profileData!.data.image,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.r),
                            child: Text(
                              blocProfile.profileData!.data.fullname,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.r),
                            child: Text(
                              blocProfile.profileData!.data.phone,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.greenLite,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Container(
              child: Column(
                children: [
                  ItemMyAccount(
                    title: LocaleKeys.personalInfo.tr(),
                    image: Assets.images.profileInfo.path,
                    page: PersonalView(),
                  ),
                  ItemMyAccount(
                    title: LocaleKeys.wallet.tr(),
                    image: Assets.images.boket.path,
                    page: WalletView(),
                  ),
                  ItemMyAccount(
                    title: LocaleKeys.addresses.tr(),
                    image: Assets.images.addresses.path,
                    page: AddressesView(),
                  ),
                  ItemMyAccount(
                    title: LocaleKeys.payment.tr(),
                    image: Assets.images.pay.path,
                    page: PaymentsView(),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ItemMyAccount(
                    title: LocaleKeys.knownQuestions.tr(),
                    image: Assets.images.rebeatQuestion.path,
                    page: FAQsView(),
                  ),
                  ItemMyAccount(
                    title: LocaleKeys.privacyPolicy.tr(),
                    image: Assets.images.privacy.path,
                    page: PrivacyPolicy(),
                  ),
                  ItemMyAccount(
                    title: LocaleKeys.contactWithUs.tr(),
                    image: Assets.images.contentUs.path,
                    page: ContactUsView(),
                  ),
                  ItemMyAccount(
                    title: LocaleKeys.suggestions.tr(),
                    image: Assets.images.sugesstion.path,
                    page: SuggestionsAndComplaints(),
                  ),
                  ListTile(
                    onTap: () {
                      Share.share(
                        'text',
                        subject: "any subjrct",
                      );
                    },
                    leading: Image.asset(
                      Assets.images.shareApp.path,
                    ),
                    title: Text(
                      LocaleKeys.shareApp.tr(),
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.green),
                    ),
                    trailing: Image.asset(
                      Assets.images.rowBack.path,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ItemMyAccount(
                    title: LocaleKeys.aboutApp.tr(),
                    image: Assets.images.aboutUs.path,
                    page: AboutAppView(),
                  ),
                  ListTile(
                    onTap: () async {
                      if (context.locale == Locale('ar')) {
                        await context.setLocale(Locale('en'));
                      } else {
                        await context.setLocale(Locale('ar'));
                      }
                    },
                    leading: Image.asset(
                      Assets.images.changeLanguage.path,
                    ),
                    title: Text(
                      LocaleKeys.changeLanguage.tr(),
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.green),
                    ),
                    trailing: Image.asset(
                      Assets.images.rowBack.path,
                    ),
                  ),
                  ItemMyAccount(
                    title: LocaleKeys.conditions.tr(),
                    image: Assets.images.policy.path,
                  ),
                  ListTile(
                    onTap: () async {
                      final url = 'https://pub.dev/packages/url_launcher';
                      await canLaunchUrl(Uri.parse(url))
                          ? await launchUrl(Uri.parse(url))
                          : throw 'Could not launch $url';
                    },
                    leading: Image.asset(
                      Assets.images.quality.path,
                    ),
                    title: Text(
                      LocaleKeys.rateApp.tr(),
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.green),
                    ),
                    trailing: Image.asset(
                      Assets.images.rowBack.path,
                    ),
                  ),
                ],
              ),
            ),
            BlocConsumer(
              bloc: blocLogout,
              listener: (context, state) {
                if (state is LogoutFailedState) {
                  Toast.show(state.msg.toString(), context);
                }
                if (state is LogoutSuccessState) {
                  MagicRouter.navigateTo(LogInScreen());
                }
                ;
              },
              builder: (BuildContext context, Object? state) {
                return ListTile(
                  onTap: () {
                    blocLogout.add(LogoutEvent());
                  },
                  title: CacheHelper.getDeviceToken().isEmpty
                      ? Text(
                          LocaleKeys.login.tr(),
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.green),
                        )
                      : Text(
                          LocaleKeys.logout.tr(),
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.green),
                        ),
                  trailing: Image.asset(
                    Assets.images.rowBack.path,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
