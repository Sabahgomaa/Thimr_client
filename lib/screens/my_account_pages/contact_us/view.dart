import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/widgets/button.dart';
import 'package:thimar_client/shared/widgets/input_without_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../shared/widgets/app_bar.dart';
import 'bloc/bloc.dart';

class ContactUsView extends StatelessWidget {
  ContactUsView({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<ContactUsBloc>()
    ..add(GetContactUsEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: LocaleKeys.contactWithUs.tr(),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (bloc.contactUsData == null) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: EdgeInsets.all(20.r),
                    child: Container(
                      height: 250.h,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Container(
                              height: 198.h,
                              width: 342.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: GoogleMap(
                                mapType: MapType.normal,
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(
                                    bloc.contactUsData!.contacts.lat,
                                    bloc.contactUsData!.contacts.lng,
                                  ),
                                  zoom: 14,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Container(
                              width: 312.w,
                              height: 119.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.r),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(4.r),
                                            child: Image.asset(Assets
                                                .images.locationContactUs.path),
                                          ),
                                          Text(
                                            bloc.contactUsData!.contacts
                                                .location,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              // color: AppColors.greenLite,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(4.r),
                                            child: Image.asset(Assets
                                                .images.callingContactUs.path),
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              final url =
                                                  "tel:${bloc.contactUsData!.contacts.phone}";

                                              await canLaunchUrl(Uri.parse(url))
                                                  ? await launchUrl(
                                                      Uri.parse(url))
                                                  : throw 'Could not launch $url';
                                            },
                                            child: Text(
                                              '${bloc.contactUsData!.contacts.phone}',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(4.r),
                                            child: Image.asset(Assets
                                                .images.messageContactUs.path),
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              final url =
                                                  "mailto:${bloc.contactUsData!.contacts.email}";
                                              await canLaunchUrl(Uri.parse(url))
                                                  ? await launchUrl(Uri.parse(url))
                                                  : throw 'Could not launch $url';
                                            },
                                            child: Text(
                                              '${bloc.contactUsData!.contacts.email}',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              }),
          Expanded(
            child: Column(
              children: [
                Text(
                  LocaleKeys.orYouCanSendMessage.tr(),
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Container(
                    height: 315.h,
                    child: Form(
                      key: bloc.formKey,
                      child: Column(
                        children: [
                          InputWithoutImage(
                            label: LocaleKeys.name.tr(),
                            type: TextInputType.name,
                            controller: bloc.fullNameController,
                          ),
                          InputWithoutImage(
                            label: LocaleKeys.phoneNumber.tr(),
                            type: TextInputType.phone,
                            controller: bloc.phoneController,
                          ),
                          InputWithoutImage(
                            label: LocaleKeys.subject.tr(),
                            type: TextInputType.text,
                            controller: bloc.contentController,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.r),
                            child: CustomButton(
                                text: LocaleKeys.send.tr(),
                                fontSize: 15.sp,
                                textColor: AppColors.whiteApp,
                                pressed: () {
                                  bloc.add(ContactUsEvent());
                                },
                                width: 312.w,
                                height: 54.h),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
