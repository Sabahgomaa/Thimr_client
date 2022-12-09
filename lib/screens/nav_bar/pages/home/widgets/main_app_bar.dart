import 'package:badges/badges.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../../shared/widgets/button.dart';
import '../../../../add_addresses/view.dart';
import '../../../../cart/bloc/bloc.dart';
import '../../../../cart/view.dart';
import '../../../../my_account_pages/addresses/bloc/bloc.dart';
import '../../../../my_account_pages/addresses/components/item_addresses.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  MainAppBar({Key? key}) : super(key: key);

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}

class _MainAppBarState extends State<MainAppBar> {
  final blocAddresses = KiwiContainer().resolve<AddressesBloc>()
    ..add(GetAddressesEvent());

  final blocCart = KiwiContainer().resolve<CartBloc>()..add(GetCartEvent());
  String selectAddresses = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectAddresses;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.h,
              child: Image.asset(
                Assets.images.logoApp.path,
              ),
            ),
            Text(
              LocaleKeys.thimarCart.tr(),
              style: TextStyle(
                  color: AppColors.green,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            Expanded(
              child: GestureDetector(
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
                                child: BlocBuilder(
                                  bloc: blocAddresses,
                                  builder: (context, state) {
                                    if (blocAddresses.addressesData == null) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    } else {
                                      return ListView.builder(
                                        itemCount: blocAddresses
                                            .addressesData!.addresses.length,
                                        itemBuilder: (context, index) {
                                          return ItemAddress(
                                            model: blocAddresses.addressesData!
                                                .addresses[index],
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
                                  child: CustomeButton(
                                    pressed: () {
                                      MagicRouter.navigateTo(AddAddresses());
                                    },
                                    width: 370.w,
                                    height: 54.h,
                                    fontSize: 15.sp,
                                    buttonColor:
                                        AppColors.greyLite.withOpacity(.2),
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
                child: Column(
                  children: [
                    Text(
                      LocaleKeys.deliverTo.tr(),
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 14.sp,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${selectAddresses}',
                        style: TextStyle(
                          color: AppColors.green,
                          fontSize: 14.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            BlocBuilder(
              bloc: blocCart,
              builder: (BuildContext context, state) {
                if (blocCart.cartData == null) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return GestureDetector(
                    onTap: () {
                      MagicRouter.navigateTo(CartScreen());
                    },
                    child: Badge(
                      toAnimate: false,
                      shape: BadgeShape.circle,
                      badgeColor: AppColors.green,
                      borderRadius: BorderRadius.circular(8),
                      position: BadgePosition.bottomStart(bottom: 20, start: 2),
                      badgeContent: Text(
                          blocCart.cartData!.data.length.toString(),
                          style: TextStyle(color: Colors.white)),
                      child: Container(
                        margin: EdgeInsets.all(5.r),
                        height: 37.h,
                        width: 32.w,
                        decoration: BoxDecoration(
                            color: AppColors.greyLite.withOpacity(.1),
                            borderRadius: BorderRadius.circular(8.r),
                            image: DecorationImage(
                                image: AssetImage(Assets.images.sala.path))),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
