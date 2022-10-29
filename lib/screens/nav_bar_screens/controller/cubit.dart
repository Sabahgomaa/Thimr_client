import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/screens/nav_bar_screens/controller/states.dart';

import '../screens/nav_bar_screens/favorite/favorite_screen.dart';
import '../screens/nav_bar_screens/home/home_screen.dart';
import '../screens/nav_bar_screens/notification/notification_screen.dart';
import '../screens/nav_bar_screens/order/order_screen.dart';
import '../screens/nav_bar_screens/profile/profile_screen.dart';



class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInit());

  static HomeCubit of(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const HomeScreen(),
    const OrderScreen(),
    const NotificationScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(HomeBottomNavState());
  }

// bool isCurrentIndex(int value)=> currentIndex==value;
}
