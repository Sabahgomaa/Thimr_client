import 'package:flutter/material.dart';

import '../widgets/dapartment_item.dart';


class ListDepartments extends StatelessWidget {
  const ListDepartments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) {
          return DapartmentItem();
        },
        // physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
