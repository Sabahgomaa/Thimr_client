import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/styles.dart';

class InputWithoutImage extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final type;

  const InputWithoutImage(
      {Key? key, required this.label, this.controller, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        maxLines: 4,
        controller: controller,
        minLines: 1,
        cursorColor:AppColors.green,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: AppColors.greyLite, fontSize: 15.sp),
          border: myInputBorderStyle,
          enabledBorder: myInputBorderStyle,
          focusedBorder: myInputBorderStyle,
        ),
      ),
    );
  }
}
