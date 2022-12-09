import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/screens/nav_bar/pages/notifications/Components/item_notification.dart';

import '../../../../generated/locale_keys.g.dart';
import 'bloc/bloc.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<NotificationBloc>()
    ..add(GetNotificationEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.notifications.tr(),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (bloc.notificationsData == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: bloc.notificationsData!.data.notifications.length,
                itemBuilder: (context, index) => NotificationItem(
                    model: bloc.notificationsData!.data.notifications[index]),
              );
            }
          }),
    );
  }
}
