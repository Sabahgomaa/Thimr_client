import 'package:flutter/material.dart';
import 'package:thimar_client/screens/nav_bar/pages/orders/components/order_item.dart';

class ListOfMyOrder extends StatelessWidget {
  const ListOfMyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // shrinkWrap: true,
      //scrollDirection: Axis.horizontal,
      itemCount: 15,
      itemBuilder: (context, index) {
        return OrderItem();
      },
      // physics: NeverScrollableScrollPhysics(),
    );
  }
}
