import 'package:flutter/material.dart';

import '../const/colors.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final String hintLabel;
  final IconData? suffix;
  final Function(String)? onSubmit;
  final Function(String)? validate;
  final Function(String)? onChange;
  final Function()? suffixPressed;
  final IconData? prefix;
  bool isPassword = false;
  final dynamic onTap;
  double radius = 0;
  double? width = double.infinity;
  double? height = 0;

  CustomTextFormField({
    Key? key,
    this.controller,
    this.suffix,
    this.prefix,
    this.width,
    this.height,
    this.radius = 0,
    
    this.onSubmit,
    this.onChange,
    this.suffixPressed,
    this.validate,
    this.isPassword = false,
    this.type,
    this.onTap,
    required this.hintLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey.withOpacity(.5)),
        borderRadius: BorderRadius.circular(radius),
    ),
    child: TextFormField(
        onTap: onTap,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        cursorColor: AppColors.grey,
        //validator: validate,
        decoration: InputDecoration(
          // labelText: label,
          hintText: hintLabel,
          labelStyle: const TextStyle(color: AppColors.grey,fontFamily: "Tajawal",),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          // enabledBorder: const UnderlineInputBorder(
          //   borderSide: BorderSide(color: Colors.pink),
          // ),
          // focusedBorder: const UnderlineInputBorder(
          //   borderSide: BorderSide(color: Colors.pink),
          // ),
          suffixIcon: suffix != null
              ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
              textDirection: TextDirection.rtl,
              // color: Colors.pink,
            ),
            // color: Colors.pink,
          )
              : null,
        )));
  }
}
