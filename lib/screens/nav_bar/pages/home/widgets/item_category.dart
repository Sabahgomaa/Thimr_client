import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/shared/router.dart';
import '../../../../../../shared/const/colors.dart';
import '../../../../../models/categories_model.dart';
import '../components/category_details.dart';

class ItemCategory extends StatelessWidget {
  final Category model;

  ItemCategory({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.r, right: 8.r),
      child: GestureDetector(
        onTap: () {
          MagicRouter.navigateTo(CategoriesDetailsScreen(
            name: model.name,
            categoryId: model.id,
          ));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 73.w,
              height: 73.h,
              child: Image.network(
                model.media.toString(),
              ),
            ),
            Text(
              model.name,
              style: TextStyle(
                color: AppColors.green,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
