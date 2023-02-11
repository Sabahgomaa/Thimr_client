import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles.dart';

class Input extends StatefulWidget {
  final String? hint, imageName;
  final bool isPhone;
  final String? labelText;
  final bool secure, autofocus;
  final type;
  final TextEditingController? controller;
  final onInputPress;
  final isEnabled;
  final bool isCitySelection;
  final inputAction;

  const Input({
    Key? key,
    this.isEnabled = true,
    this.hint,
    this.onInputPress,
    this.imageName,
    this.controller,
    this.isPhone = false,
    this.labelText,
    this.secure = false,
    this.type,
    this.autofocus = true,
    this.isCitySelection = false,
    this.inputAction = TextInputAction.next,
  }) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.r),
      child: Row(
        children: [
          if (widget.isPhone)
            SizedBox(
              width: 8.w,
            ),
          if (widget.isPhone)
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Container(
                height: 70.h,
                decoration: BoxDecoration(
                  // color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                width: 69,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.r, vertical: 8.r),
                      child: Image.asset(
                        'assets/images/alaim.png',
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      '+966',
                      style:
                          TextStyle(color: Color(0xff4C8613), fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!widget.isEnabled) {
                  widget.onInputPress;
                }
              },
              child: TextFormField(
                enabled: widget.isEnabled,
                keyboardType: widget.type,
                textInputAction:widget.inputAction,
                obscureText: widget.secure,
                cursorColor: Colors.black,
                autofocus: widget.autofocus,
                controller: widget.controller,
                decoration: InputDecoration(
                  labelText: widget.labelText,
                  hintText: widget.hint,
                  border: myInputBorderStyle,
                  enabledBorder: myInputBorderStyle,
                  focusedBorder: myInputBorderStyle,
                  labelStyle:
                      TextStyle(color: Color(0xffAFAFAF), fontSize: 15.sp),
                  hintStyle:
                      TextStyle(color: Color(0xffAFAFAF), fontSize: 15.sp),
                  fillColor: Colors.black,
                  prefixIcon: Container(
                    padding: EdgeInsetsDirectional.only(
                        start: 18.r, end: 11.r, top: 10.r, bottom: 10.r),
                    child: Image.asset(
                      "assets/images/${widget.imageName}",
                      height: 15.h,
                      width: 15.w,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
