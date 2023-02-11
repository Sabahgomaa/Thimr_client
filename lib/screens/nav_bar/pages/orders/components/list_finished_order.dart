import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/screens/nav_bar/pages/orders/bloc/bloc.dart';
import 'package:thimar_client/shared/router.dart';

import '../../../../order_details/view.dart';
import 'item_finished_order.dart';

class FinishedOrderScreen extends StatelessWidget {
  FinishedOrderScreen({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<OrdersBloc>()
    ..add(GetOrdersFinishedEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        buildWhen: (previous, current) =>
        current is GetOrdersFinishedLoadingState ||
            current is GetOrdersFinishedSuccessState,
        builder: (context, state) {
          if (bloc.orderData == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return bloc.orderData!.data.isEmpty
                ? Center(
                child: Text(
                  "Current Empty",
                  style: TextStyle(),
                ))
                : ListView.builder(
                itemCount: bloc.orderData!.data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        MagicRouter.navigateTo(DetailsOrderView(
                          isCurrent: false,
                          id: bloc.orderData!.data[index].id,
                        ));
                      },
                      child: ItemFinishedOrder(
                        finishedOrder: bloc.finishedOrder!.data[index],
                      ));
                });
          }
        });
  }
}
