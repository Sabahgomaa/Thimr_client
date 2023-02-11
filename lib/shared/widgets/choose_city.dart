import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/generated/locale_keys.g.dart';
import 'package:thimar_client/shared/const/colors.dart';

import '../../screens/auth_cycle/register/bloc/bloc.dart';
import '../../screens/auth_cycle/register/cities_Data.dart';
import 'faild_state_try_again.dart';
import 'loading_progress.dart';

class ChooseCityDialog extends StatefulWidget {
  final String? selectedCityId;

  const ChooseCityDialog({Key? key, this.selectedCityId})
      : super(key: key);

  @override
  State<ChooseCityDialog> createState() => _ChooseCityDialogState();
}

class _ChooseCityDialogState extends State<ChooseCityDialog> {
  final bloc = KiwiContainer().resolve<RegisterBloc>()
    ..add((GetCitiesEventStart()));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      height: 300.h,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.clear)),
              Expanded(
                  child: Center(
                      child: Text(LocaleKeys.chooseCity.tr(),
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black)))),
            ],
          ),
          const Divider(),
          BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is GetCitiesLoadingState) {
                  return const LoadingProgress();
                } else if (state is GetCitiesSuccessState) {
                  List<Cities> cities = state.model.data;
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pop(context, cities[index]);
                          },
                          child: Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Center(
                                child: Text(cities[index].name,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: cities[index].id ==
                                            widget.selectedCityId
                                            ? AppColors.green
                                            : null,
                                        ))),
                          ),
                        ),
                        itemCount: cities.length,
                        separatorBuilder: (context, index) => const Divider()),
                  );
                } else if (state is GetCitiesFailedState) {
                  return FailedStateTryAgain(
                    msg: state.error,
                    onPress: () {
                      bloc.add(GetCitiesEventStart());
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
        ],
      ),
    );
  }
}
