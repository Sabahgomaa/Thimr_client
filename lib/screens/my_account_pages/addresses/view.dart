import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'package:thimar_client/shared/widgets/button.dart';
import '../../../generated/locale_keys.g.dart';
import '../../add_addresses/view.dart';
import '../components/app_bar.dart';
import 'bloc/bloc.dart';
import 'components/item_addresses.dart';

class AddressesScreen extends StatelessWidget {
  AddressesScreen({Key? key}) : super(key: key);

  final bloc = KiwiContainer().resolve<AddressesBloc>()
    ..add(GetAddressesEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: LocaleKeys.addresses.tr(),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (bloc.addressesData == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: bloc.addressesData!.addresses.length,
              itemBuilder: (context, index) {
                return ItemAddress(
                  model: bloc.addressesData!.addresses[index],
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.r),
        child: DottedBorder(
          dashPattern: [4, 5],
          strokeWidth: 1,
          strokeCap: StrokeCap.round,
          borderType: BorderType.RRect,
          color: AppColors.green,
          radius: Radius.circular(10.r),
          child: CustomeButton(
            pressed: () {
              MagicRouter.navigateTo(AddAddresses());
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
    );
  }
}
