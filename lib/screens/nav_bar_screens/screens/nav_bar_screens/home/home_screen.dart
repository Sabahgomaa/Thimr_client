import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../shared/const/colors.dart';
import '../../../../../shared/widgets/input.dart';
import 'components/list_department.dart';
import 'components/list_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            // Row(
            //   children: [
            Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 72.w,
            height: 22.28.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logot.png'),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'التوصيل إلى',
              style: TextStyle(color: AppColors.green, fontSize: 12.sp),
              textAlign: TextAlign.center,
            ),
            Text(
              'شارع الملك فهد - جدة',
              style: TextStyle(color: AppColors.green, fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.grey.withOpacity(.4),
              ),
              child: GestureDetector(
                  onTap: () {}, child: Image.asset('assets/images/sala.png')),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Input(
              hint: 'ابحث عن ماتريد؟',
              imageName: 'search_icon.png',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الأقسام',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                  Text(
                    'عرض الكل',
                    style: TextStyle(
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
            ListDepartments(),
           // ListProducts(),
          ],
        ),
      ),
    );
  }
}
