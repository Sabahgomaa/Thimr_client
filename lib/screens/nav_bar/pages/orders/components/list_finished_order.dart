import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/screens/nav_bar/pages/orders/bloc/bloc.dart';
import 'package:thimar_client/screens/nav_bar/pages/orders/components/item_order.dart';
import 'package:thimar_client/shared/router.dart';

import '../../../../order_details/view.dart';

class FinishedOrderScreen extends StatelessWidget {
  FinishedOrderScreen({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<OrdersBloc>()
    ..add(GetOrdersFinishedEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (bloc.orderData == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: bloc.orderData!.data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        MagicRouter.navigateTo(DetailsOrder(
                          isCurrent: false,
                          id: bloc.orderData!.data[index].id,
                        ));
                      },
                      child: ItemOrder(
                        currentOrders: bloc.orderData!.data[index],
                      ));
                });
          }
        });
  }
}
