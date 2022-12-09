import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/screens/nav_bar/pages/favorites/view.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/view.dart';
import 'package:thimar_client/screens/nav_bar/pages/notifications/view.dart';
import 'package:thimar_client/screens/nav_bar/pages/orders/view.dart';
import 'package:thimar_client/screens/nav_bar/pages/profile/view.dart';
import 'package:thimar_client/shared/const/colors.dart';

import '../../generated/locale_keys.g.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    OrderScreen(),
    NotificationsScreen(),
    FavoritesScreen(),
    ProfileScreen(),
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
                    backgroundColor: const Color(0xff4C8613),
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 7.h),
                      child: Image.asset(
                        'assets/images/${icons[index]}.png',
                        height: 21.h,
                        width: 21.w,
                        color: index == currentIndex
                            ? Colors.white
                            : AppColors.greyLite,
                      ),
                    ),
                    label: labels[index],
                  ))),
      body: screens[currentIndex],
    );
  }
}
