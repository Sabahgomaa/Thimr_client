import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import '../../../../shared/const/colors.dart';
import '../model.dart';

class ItemAddress extends StatelessWidget {
  final Addresses? model;

  ItemAddress({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, model!.location);
      },
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Container(
          width: 343.w,
          height: 130.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.green),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model!.type,
                      // LocaleKeys.house.tr(),
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.r),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(2.r),
                              child: GestureDetector(
                                  child:
                                      Image.asset(Assets.images.delete.path)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.r),
                              child: Image.asset(Assets.images.edit.path),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Text(
                    'العنوان : ${model!.location}',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  model!.description,
                  // LocaleKeys.description.tr(),
                  style: TextStyle(
                    color: AppColors.greyLite,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  model!.phone,
                  //  LocaleKeys.phoneNumber.tr(),
                  style: TextStyle(
                    color: AppColors.greyLite,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
