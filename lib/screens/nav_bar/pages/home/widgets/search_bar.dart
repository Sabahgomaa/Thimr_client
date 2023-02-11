import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_client/shared/const/colors.dart';
import '../../../../../generated/locale_keys.g.dart';

class SearchBar extends StatelessWidget {
  final bool isEnabled;
  SearchBar({Key? key,  this.isEnabled=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        autofocus: false,
        enabled: isEnabled,
        cursorColor: AppColors.green,
      //  controller: bloc.searchController,
        decoration: InputDecoration(
          hintText: LocaleKeys.searchOnWhatYouNeed.tr(),
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
            child: SvgPicture.asset(
              "assets/images/svg_images/search.svg",
              height: 15.h,
              width: 15.w,
            ),
          ),
        ),
      ),
    );
  }
}
