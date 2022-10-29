import 'package:flutter/material.dart';

import 'item_dapartment.dart';


class ListDepartments extends StatelessWidget {
  const ListDepartments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (context, index) {
          return DepartmentItem();
        },
      ),
    );
  }
}
