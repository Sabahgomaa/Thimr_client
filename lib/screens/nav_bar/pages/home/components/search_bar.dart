import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/shared/const/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        // autofocus: true,
        cursorColor: AppColors.green,
        decoration: InputDecoration(
          hintText: 'ابحث عن ماتريد؟',
          filled: true,
          fillColor: AppColors.greyLite.withOpacity(.1),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15.r),
          ),
          hintStyle: TextStyle(color: Color(0xffAFAFAF), fontSize: 15.sp),
          prefixIcon: Container(
            padding: const EdgeInsetsDirectional.only(
                start: 18, end: 11, top: 10, bottom: 10),
            child: Image.asset(
              "assets/images/search_icon.png",
              height: 15,
              width: 15,
            ),
          ),
        ),
      ),
    );
  }
}
