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
import '../../../shared/widgets/app_bar.dart';
import '../../../shared/widgets/loading_progress.dart';
import '../../add_address/view.dart';
import 'bloc/bloc.dart';
import 'components/item_address.dart';

class AddressesView extends StatelessWidget {
  AddressesView({Key? key}) : super(key: key);

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
        buildWhen: (previous, current) =>
        current is GetAddressesLoadingState ||
            current is GetAddressesSuccessState,
        builder: (context, state) {
          if (state is GetAddressesLoadingState) {
            return LoadingProgress();
          } else {
            return bloc.addressesData ==null
                ? Text("empty")
                : ListView.builder(
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
    );
  }
}
