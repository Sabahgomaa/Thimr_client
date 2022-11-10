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
        title: Text(
          'الإشعارات',
        ),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => NotificationItem(),
      ),
    );
  }
}
