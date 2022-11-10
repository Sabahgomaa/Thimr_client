import 'package:flutter/material.dart';
import 'package:thimar_client/shared/router.dart';
import 'item_order.dart';
import 'details_order.dart';

class CurrentOrderScreen extends StatelessWidget {
  const CurrentOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
          MagicRouter.navigateTo(DetailsOrder(isCurrent: true,));
        },
        child: ItemOrder());
      },
    );
  }
}