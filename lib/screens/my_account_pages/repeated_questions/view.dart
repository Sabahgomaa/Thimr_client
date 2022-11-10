import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/gen/assets.gen.dart';
import 'package:thimar_client/shared/router.dart';

import '../../../shared/const/colors.dart';

class RepeatedQuestions extends StatefulWidget {
  const RepeatedQuestions({Key? key}) : super(key: key);

  @override
  State<RepeatedQuestions> createState() => _RepeatedQuestionsState();
}

class _RepeatedQuestionsState extends State<RepeatedQuestions> {
  static const description =
      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبي';
  final List<Item> item = [
    Item(header: 'كيفية الدفع عن طريق البطاقة الإئتمانيه؟', body: description),
    Item(
        header: 'كل ما تريد معرفته عن أكواد الخصم/ الكوبونات',
        body: description),
    Item(header: 'هل يتم وضع منتجات جديدة كل فترة؟', body: description),
  ];

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
          'أسئلة متكررة',
          style: TextStyle(
            color: AppColors.green,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: item
              .map((item) => ExpansionPanelRadio(
                    value: item.header,
                    headerBuilder: (context, isExpanded) => ListTile(
                      title: Text(
                        item.header,
                        style: TextStyle(
                          color: AppColors.green,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    body: ListTile(
                      title: Text(
                        item.body,
                        style: TextStyle(
                          color: AppColors.greyLite,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class Item {
  final String header;
  final String body;

  Item({required this.header, required this.body});
}
