import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/screens/nav_bar/pages/notifications/Components/item_notification.dart';
import 'package:thimar_client/shared/const/colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'الإشعارات',
          style: TextStyle(
              color: AppColors.green,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return NotificationItem();
        },
        // physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
