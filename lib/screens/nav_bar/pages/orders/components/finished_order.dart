import 'package:flutter/material.dart';
import 'package:thimar_client/screens/nav_bar/pages/orders/components/details_order.dart';
import 'package:thimar_client/screens/nav_bar/pages/orders/components/item_order.dart';
import 'package:thimar_client/shared/router.dart';

class EndedOrderScreen extends StatelessWidget {
  const EndedOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
          MagicRouter.navigateTo(DetailsOrder(isCurrent: false,));
        },
        child: ItemOrder());
      },
    );
  }
}
