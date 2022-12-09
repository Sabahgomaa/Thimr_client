import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/shared/router.dart';
import '../bloc/bloc.dart';
import 'item_order.dart';
import '../../../../order_details/view.dart';

class CurrentOrderScreen extends StatelessWidget {
  CurrentOrderScreen({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<OrdersBloc>()
    ..add(GetOrdersCurrentEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (bloc.orderData == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: bloc.orderData!.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      MagicRouter.navigateTo(DetailsOrder(
                        isCurrent: true,
                        id: bloc.orderData!.data[index].id,
                      ));
                    },
                    child: ItemOrder(
                      currentOrders: bloc.orderData!.data[index],
                    ));
              },
            );
          }
        });
  }
}
