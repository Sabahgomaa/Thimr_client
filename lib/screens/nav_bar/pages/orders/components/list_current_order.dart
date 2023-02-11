import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/shared/router.dart';
import '../../../../../shared/widgets/loading_progress.dart';
import '../bloc/bloc.dart';
import 'item_current_order.dart';
import '../../../../order_details/view.dart';

class CurrentOrderScreen extends StatelessWidget {
  CurrentOrderScreen({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<OrdersBloc>()
    ..add(GetOrdersCurrentEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        buildWhen: (previous, current) =>
            current is GetOrdersCurrentLoadingState ||
            current is GetOrdersCurrentSuccessState,
        builder: (context, state) {
          if (bloc.orderData == null) {
            return LoadingProgress();
          } else {
            return bloc.orderData!.data.isEmpty
                ? Center(
                    child: Text(
                    "Current Empty",
                    style: TextStyle(),
                  ))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: bloc.orderData!.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            MagicRouter.navigateTo(DetailsOrderView(
                              isCurrent: true,
                              id: bloc.orderData!.data[index].id,
                            ));
                          },
                          child: ItemCurrentOrder(
                            currentOrders: bloc.orderData!.data[index],
                          ));
                    },
                  );
          }
        });
  }
}
