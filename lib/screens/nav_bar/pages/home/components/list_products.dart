import 'package:flutter/material.dart';
import 'package:thimar_client/shared/router.dart';

import '../../../../show_product.dart';
import 'item_product.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1.0,
          childAspectRatio: 163 / 230,
          mainAxisSpacing: 1.0,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              MagicRouter.navigateTo(ShowProductScreen());
            },
            child: ItemProduct(),
          );
        },
      ),
    );
  }
}
