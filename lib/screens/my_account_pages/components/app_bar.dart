import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';

class AppBarComponent extends StatelessWidget  {
  final String title;
  const AppBarComponent({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          MagicRouter.pop();
        },
        child: Image.asset(Assets.images.back.path),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'سياسة الخصوصية',
        style: TextStyle(
          color: AppColors.green,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
