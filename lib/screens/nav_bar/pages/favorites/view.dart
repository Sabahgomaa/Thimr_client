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
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'المفضلة',
          style: TextStyle(
              color: AppColors.green,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 12,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
          ),
          itemBuilder: (context, index) {
            return  ProductItem();
          },
        ),
      ),
    );
  }
}
