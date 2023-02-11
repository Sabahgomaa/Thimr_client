import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../shared/const/colors.dart';

class HintsAndInstructions extends StatelessWidget {
  const HintsAndInstructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.hintsAndInstructions.tr(),
          style: TextStyle(
            color: AppColors.green,
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.r),
          child: Center(
            child: TextFormField(
              maxLines: 4,
              // controller: controller,
              //minLines: 1,
              cursorColor: AppColors.green,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                // labelStyle: TextStyle(color: AppColors.greyLite, fontSize: 15.sp),
                border: inputBorderStyle,
                enabledBorder: inputBorderStyle,
                focusedBorder: inputBorderStyle,
              ),
            ),
          ),
        )
      ],
    );
  }
}

InputBorder inputBorderStyle = OutlineInputBorder(
  borderSide: const BorderSide(
    color: AppColors.greyLite,
  ),
  borderRadius: BorderRadius.circular(15),
);
