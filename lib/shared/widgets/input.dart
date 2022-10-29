import 'package:flutter/material.dart';
import '../style.dart';

class Input extends StatelessWidget {
  final String hint, imageName;
  final bool isPhone;
  final String? labelText;
  final TextEditingController? controller;

  const Input(
      {Key? key,
      required this.hint,
      required this.imageName,
      this.controller,
      this.isPhone = false,this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          if (isPhone)
            const SizedBox(
              width: 8,
            ),
          if (isPhone)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  // color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(25),
                ),
                width: 69,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: Image.asset(
                        'assets/images/alaim.png',
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      '+966',
                      style: TextStyle(color: Color(0xff4C8613), fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: labelText,
                hintText: hint,
                border: myInputBorderStyle,
                enabledBorder: myInputBorderStyle,
                focusedBorder: myInputBorderStyle,
                hintStyle:
                    const TextStyle(color: Color(0xffAFAFAF), fontSize: 15),
                prefixIcon: Container(
                  padding: const EdgeInsetsDirectional.only(
                      start: 18, end: 11, top: 10, bottom: 10),
                  child: Image.asset(
                    "assets/images/$imageName",
                    height: 15,
                    width: 15,
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
