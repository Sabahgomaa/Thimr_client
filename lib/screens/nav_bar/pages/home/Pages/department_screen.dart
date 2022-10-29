import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import '../../../../../../shared/const/colors.dart';
import '../../../../../../shared/widgets/input.dart';
import '../components/item_product.dart';

class DepartmentScreen extends StatelessWidget {
  const DepartmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.grey.withOpacity(.4),
            ),
            child: GestureDetector(
                onTap: () {},
                child: Image.asset(Assets.images.backRow.toString())),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'خضروات',
          style: TextStyle(
              color: AppColors.green,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
         // physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Input(
              hint: 'ابحث عن ماتريد؟',
              imageName: 'search_icon.png',
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 163 / 230,
                crossAxisCount: 2,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
              ),
              itemBuilder: (context, index) {
                return  ProductItem();
              },
            ),
          ],
        ),
      ),
    );
  }
}
