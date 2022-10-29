import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/const/colors.dart';

import 'controller/cubit.dart';
import 'controller/states.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.of(context);
    return  BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              unselectedLabelStyle: TextStyle(color: AppColors.greyLite),
              onTap: (index) {
                 cubit.changeBottom(index);
              },
               currentIndex: cubit.currentIndex,
              backgroundColor: AppColors.green,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(Assets.images.home.path),
                    label: 'الرئيسية'),
                BottomNavigationBarItem(
                    icon: Image.asset(Assets.images.order.path),
                    label: 'طلباتي'),
                BottomNavigationBarItem(
                    icon: Image.asset(Assets.images.notification.path),
                    label: 'الإشعارات'),
                BottomNavigationBarItem(
                    icon: Image.asset(Assets.images.favorite.path),
                    label: 'المفضلة'),
                BottomNavigationBarItem(
                    icon: Image.asset(Assets.images.profile.path),
                    label: 'حسابي')
              ],
            ),
          );
        },
    );
  }
}
