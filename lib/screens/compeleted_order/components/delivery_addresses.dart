import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../shared/const/colors.dart';
import '../../../shared/router.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/loading_progress.dart';
import '../../add_address/view.dart';
import '../../my_account_pages/addresses/bloc/bloc.dart';
import '../../my_account_pages/addresses/components/item_address.dart';

class DeliveryAddresses extends StatefulWidget {
  const DeliveryAddresses({Key? key}) : super(key: key);

  @override
  State<DeliveryAddresses> createState() => _DeliveryAddressesState();
}

class _DeliveryAddressesState extends State<DeliveryAddresses> {
  final bloc = KiwiContainer().resolve<AddressesBloc>()
    ..add(GetAddressesEvent());
  String selectAddresses = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectAddresses;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(25.r),
                      topStart: Radius.circular(25.r)),
                ),
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            LocaleKeys.addresses.tr(),
                            style: TextStyle(
                                color: AppColors.green, fontSize: 15.sp),
                          ),
                        ),
                        Container(
                          height: 300.h,
                          child: BlocConsumer(
                            bloc: bloc,
                            listener: (context, state) {
                              if (state is GetAddressesLoadingState) {
                                LoadingProgress();
                              }
                            },
                            builder: (context, state) {
                              if (bloc.addressesData == null) {
                                return Center(child: Text('Addresses Empty'));
                              } else {
                                return ListView.builder(
                                  itemCount:
                                      bloc.addressesData!.addresses.length,
                                  itemBuilder: (context, index) {
                                    return ItemAddress(
                                      model:
                                          bloc.addressesData!.addresses[index],
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.r),
                          child: DottedBorder(
                            dashPattern: [4, 5],
                            strokeWidth: 1,
                            strokeCap: StrokeCap.round,
                            borderType: BorderType.RRect,
                            color: AppColors.green,
                            radius: Radius.circular(10.r),
                            child: CustomButton(
                              pressed: () {
                                MagicRouter.navigateTo(AddAddress());
                              },
                              width: 370.w,
                              height: 54.h,
                              fontSize: 15.sp,
                              buttonColor: AppColors.greyLite.withOpacity(.2),
                              textColor: AppColors.green,
                              text: LocaleKeys.addTheAddress.tr(),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                }).then((value) {
              print("==>" * 20);
              print(value);
              setState(() {
                selectAddresses = value;
              });
            });
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.r),
              child: Container(
                height: 33.h,
                width: 339.w,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.green),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  '${selectAddresses}',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
