import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/button.dart';
import 'package:thimar_client/shared/widgets/input.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'البيانات الشخصية',
          style: TextStyle(
              color: AppColors.green,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    Assets.images.photoProfile.path,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'محمد علي',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      '96654787856+',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyLite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Input(
                labelText: 'اسم المستخدم',
                imageName: 'user.png',
              ),
              Input(
                isPhone: true,
                labelText: 'رقم الجوال',
                imageName: 'phone.png',
              ),
              Input(
                labelText: 'المدينة',
                imageName: 'location.png',
              ),
              Input(
                labelText: 'كلمة المرور',
                imageName: 'location.png',
              ),
            ],
          ),
          Center(
            child: CustomeButton(
              pressed: () {},
              width: 343.w,
              height: 60.h,
              fontSize: 20.sp,
              text: 'تعديل البيانات',
            ),
          ),
        ],
      ),
    );
  }
}
