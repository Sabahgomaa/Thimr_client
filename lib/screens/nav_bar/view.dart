import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_client/screens/nav_bar/pages/favorites/view.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/view.dart';
import 'package:thimar_client/screens/nav_bar/pages/notifications/view.dart';
import 'package:thimar_client/screens/nav_bar/pages/orders/view.dart';
import 'package:thimar_client/screens/nav_bar/pages/profile/view.dart';
import 'package:thimar_client/shared/const/colors.dart';

import '../../generated/locale_keys.g.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeView(),
    OrderView(),
    NotificationsView(),
    FavoritesView(),
    ProfileView(),
  ];
  List<String> labels = [
    LocaleKeys.home.tr(),
    LocaleKeys.my_orders.tr(),
    LocaleKeys.notifications.tr(),
    LocaleKeys.favorites.tr(),
    LocaleKeys.my_account.tr(),
  ];
  List<String> icons = [
    'home',
    'order',
    'notification',
    'favorite',
    'profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColors.greyLite,
        selectedItemColor: Colors.white,
        selectedLabelStyle:
            TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
        backgroundColor: AppColors.green,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: List.generate(
          icons.length,
          (index) => BottomNavigationBarItem(
            backgroundColor: AppColors.green,
            icon: Padding(
              padding: EdgeInsets.only(bottom: 7.h),
              child: SvgPicture.asset(
                'assets/images/svg_images/${icons[index]}.svg',
                height: 21.h,
                width: 21.w,
                color:
                    index == currentIndex ? Colors.white : AppColors.greyLite,
              ),
            ),
            label: labels[index],
          ),
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
