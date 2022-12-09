import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/bloc.dart';

class DroDownCities extends StatelessWidget {
  final bloc = KiwiContainer().resolve<RegisterBloc>()..add(GetCitiesEventStart());

  DroDownCities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (bloc.citesData == null) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              direction: ShimmerDirection.ltr,
              period: const Duration(seconds: 2),
              child: Container(
                height: 50,
                decoration: ShapeDecoration(
                  color: Colors.grey[400]!,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
            );
          } else {
            return Expanded(
              child: Container(
                  height: 15.h,
                  width: 15.w,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    items: bloc.citesData!.data
                        .map(
                          (city) => DropdownMenuItem<String>(
                            value: city.id.toString(),
                            child: Text(city.name.toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      bloc.changeCityDropDown(value: value);
                    },
                    value: bloc.cityDropDownValue,
                    elevation: 2,
                    isDense: false,
                    iconSize: 40.0,
                  )),
            );
          }
        });
  }
}
