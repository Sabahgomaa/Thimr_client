import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/button.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({Key? key}) : super(key: key);

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
          'العناوين',
          style: TextStyle(
            color: AppColors.green,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding:  EdgeInsets.all(8.r),
                  child: Container(
                    width: 343.w,
                    height: 110.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.green),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'المنزل',
                                style: TextStyle(
                                  color: AppColors.green,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'العنوان : 119 طريق الملك عبدالعزيز',
                                style: TextStyle(
                                  color: AppColors.green,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'الوصف',
                                style: TextStyle(
                                  color: AppColors.greyLite,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                'رقم الجوال',
                                style: TextStyle(
                                  color: AppColors.greyLite,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset(Assets.images.delete.path),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset(Assets.images.edit.path),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

           Padding(
             padding: const EdgeInsets.only(top: 20,left: 8,right: 8),
             child: DottedBorder(
                  dashPattern: [4, 5],
                  strokeWidth: 1,
                  strokeCap: StrokeCap.round,
                  borderType: BorderType.RRect,
                  color: AppColors.green,
                  radius: Radius.circular(10),
                  child: CustomeButton(
                    pressed: () {},
                    width: 370.w,
                    height: 54.h,
                    fontSize: 15.sp,
                    buttonColor: AppColors.greyLite.withOpacity(.2),
                    textColor: AppColors.green,
                    text: 'إضافة عنوان',
                  ),
                ),
           ),
            ]),

    );
  }
}
