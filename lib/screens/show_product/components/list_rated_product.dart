import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/shared/widgets/loading_progress.dart';

import '../bloc/bloc.dart';
import '../widgets/item_rated_product.dart';

class ListRatedProduct extends StatefulWidget {
  final int id;

  ListRatedProduct({Key? key, required this.id}) : super(key: key);

  @override
  State<ListRatedProduct> createState() => _ListRatedProductState();
}

class _ListRatedProductState extends State<ListRatedProduct> {
  final bloc = KiwiContainer().resolve<ShowProductBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(GetProductRateEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (bloc.productRateData == null) {
            return LoadingProgress();
          } else {
            return bloc.productRateData!.data.isEmpty
                ? Center(
                    child: Text(
                    "Current Empty",
                    style: TextStyle(),
                  ))
                : Container(
                    height: 80,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: bloc.productRateData!.data.length,
                        itemBuilder: (context, index) {
                          return ItemRatedProduct(
                            model: bloc.productRateData!.data[index],
                          );
                        }),
                  );
          }
        });
  }
}
