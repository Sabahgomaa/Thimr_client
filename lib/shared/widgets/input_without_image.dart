import 'package:flutter/material.dart';
import 'package:thimar_client/shared/styles.dart';

class InputWithoutImage extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;

  const InputWithoutImage({Key? key, required this.hint, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        maxLines: 4,
        minLines: 1,
        decoration: InputDecoration(
          hintText: hint,
          border: myInputBorderStyle,
          enabledBorder: myInputBorderStyle,
          focusedBorder: myInputBorderStyle,
          hintStyle: const TextStyle(color: Color(0xffAFAFAF), fontSize: 15),
          // prefixIcon: Container(
          //   padding: const EdgeInsetsDirectional.only(
          //       start: 18, end: 11, top: 10, bottom: 10),
          //   child: Image.asset(
          //     "assets/images/$imageName",
          //     height: 15,
          //     width: 15,
          //   ),
          // ),
        ),
      ),
    );
  }
}
