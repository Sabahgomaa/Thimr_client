import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import '../bloc/bloc.dart';
import '../models/product_rate_model.dart';

class ItemRatedProduct extends StatelessWidget {
  final Rates model;
  final bloc = KiwiContainer().resolve<ShowProductBloc>();

  ItemRatedProduct({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.r),
      child: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  model.clientName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    model.comment,
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 55.h,
              width: 55.h,
              child: Image.network(model.clientImage),
            ),
          ],
        ),
      ),
    );
  }
}
