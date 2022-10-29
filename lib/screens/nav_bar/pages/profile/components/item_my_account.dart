import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/shared/router.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../shared/const/colors.dart';

class ItemMyAccount extends StatelessWidget {
  final String title,image;
  final Widget? page;
  const ItemMyAccount({Key? key, required this.title, required this.image, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: (){
        MagicRouter.navigateTo(page!);
    },
    leading: Image.asset(
        image,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.green),
      ),
      trailing: Image.asset(
        Assets.images.rowBack.path,
      ),
    );
  }
}
