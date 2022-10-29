import 'package:flutter/material.dart';
import 'package:thimar_client/shared/const/colors.dart';

class DropDownAddresses extends StatelessWidget {
  final List itemsList;
  final Function(String?)? onChanged;
  final String? value;

  const DropDownAddresses(
      {Key? key,
      required this.itemsList,
      required this.onChanged,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Row(textDirection: TextDirection.ltr, children: [
      //   Text('City'.toUpperCase(),
      //       textAlign: TextAlign.right,
      //       style: const TextStyle(
      //         color: Colors.white,
      //         fontSize: 15,
      //       ))
      // ]),
      Container(
          height: 33,
          width: 339,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.green),
            borderRadius: BorderRadius.circular(20),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            items: itemsList
                .map(
                  (address) => DropdownMenuItem<String>(
                    value: address.id.toString(),
                    child: Text(address.name.toString()),
                  ),
                )
                .toList(),
            onChanged: onChanged,
            value: value,
            elevation: 2,
            isDense: false,
            iconSize: 40.0,
          ))
    ]);
  }
}
