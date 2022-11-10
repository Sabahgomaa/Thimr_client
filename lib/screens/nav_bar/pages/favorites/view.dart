import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../shared/const/colors.dart';
import '../home/components/item_product.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المفضلة',
        ),
      ),
      body: GridView.builder(
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1.0,
          childAspectRatio: 163 / 230,
          mainAxisSpacing: 1.0,
        ),
        itemBuilder: (context, index) =>ItemProduct(),
      ),
    );
  }
}
