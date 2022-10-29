import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/screens/my_account_pages/addresses/view.dart';
import 'package:thimar_client/screens/my_account_pages/payments/view.dart';
import 'package:thimar_client/screens/my_account_pages/personal_info/view.dart';
import 'package:thimar_client/screens/my_account_pages/pocket_money/view.dart';

import '../../../../../shared/const/colors.dart';
import 'components/item_my_account.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
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
                  padding:  EdgeInsets.all(8.r),
                  child: Column(
                    children: [
                      Expanded(
                        child: Text(
                          'حسابي',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Image.asset(
                        Assets.images.photoProfile.path,
                      ),
                      Text(
                        'محمد علي',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '96654787856+',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greenLite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  ItemMyAccount(
                    title: "البيانات الشخصية",
                    image: Assets.images.profileInfo.path,
                    page: PersonalScreen(),
                  ),
                  ItemMyAccount(
                    title: "المحفظة",
                    image: Assets.images.boket.path,
                    page: PocketMoney(),
                  ),
                  ItemMyAccount(
                    title: "العناوين",
                    image: Assets.images.addresses.path,
                    page: AddressesScreen(),
                  ),
                  ItemMyAccount(
                    title: "الدفع",
                    image: Assets.images.pay.path,
                    page:  PaymentsScreen(),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ItemMyAccount(
                    title: "أسئلة متكررة",
                    image: Assets.images.rebeatQuestion.path,
                  ),
                  ItemMyAccount(
                    title: "سياسة الخصوصية",
                    image: Assets.images.privacy.path,
                  ),
                  ItemMyAccount(
                    title: "تواصل معنا",
                    image: Assets.images.contentUs.path,
                  ),
                  ItemMyAccount(
                    title: "الشكاوي والأقتراحات",
                    image: Assets.images.sugesstion.path,
                  ),
                  ItemMyAccount(
                      title: "مشاركة التطبيق",
                      image: Assets.images.shareApp.path),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ItemMyAccount(
                    title: "عن التطبيق",
                    image: Assets.images.aboutUs.path,
                  ),
                  ItemMyAccount(
                    title: "تغيير اللغة",
                    image: Assets.images.changeLanguage.path,
                  ),
                  ItemMyAccount(
                    title: "الشروط والأحكام",
                    image: Assets.images.policy.path,
                  ),
                  ItemMyAccount(
                    title: "تقييم التطبيق",
                    image: Assets.images.quality.path,
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "تسجيل الخروج",
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
    );
  }
}
