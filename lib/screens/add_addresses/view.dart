import 'dart:collection';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/generated/locale_keys.g.dart';
import '../../shared/const/colors.dart';
import '../../shared/widgets/button.dart';
import '../../shared/widgets/input_without_image.dart';
import '../my_account_pages/addresses/bloc/bloc.dart';
import '../my_account_pages/components/app_bar.dart';

class AddAddresses extends StatefulWidget {
  final lat, lang;

  AddAddresses({Key? key, this.lat, this.lang}) : super(key: key);

  @override
  State<AddAddresses> createState() => _AddAddressesState();
}

class _AddAddressesState extends State<AddAddresses> {
  var markers = HashSet<Marker>();
  final bloc = KiwiContainer().resolve<AddressesBloc>();
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBarComponent(
        title: LocaleKeys.addAddress.tr(),
      ),
      body: Stack(children: [
        GestureDetector(
          onTap: () async {
            Position position = await _determinePosition();

            googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 14)));

            markers.clear();

            markers.add(Marker(
                markerId: const MarkerId('currentLocation'),
                position: LatLng(position.latitude, position.longitude)));

            setState(() {});
          },
          child: GoogleMap(
            initialCameraPosition: initialCameraPosition,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
              setState(() {
                markers.add(
                  Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(37.43296265331129, -122.08832357078792),
                  ),
                );
              });
            },
            markers: markers,
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Container(
              color: Colors.white.withOpacity(.9),
              height: 325.h,
              child: Form(
                // key: bloc.formKey,
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Container(
                        height: 65.h,
                        width: 342.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 15.r, right: 8.r),
                          child: Text(
                            LocaleKeys.typeOfAddress.tr(),
                            style: TextStyle(
                              color: AppColors.greyLite,
                              fontSize: 15.sp,
                            ),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Container(
                      color: Colors.white,
                      child: InputWithoutImage(
                        label: LocaleKeys.phoneNumber.tr(),
                        type: TextInputType.phone,
                        // controller: bloc.phoneController,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white,
                      child: InputWithoutImage(
                        label: LocaleKeys.description.tr(),
                        type: TextInputType.text,
                        // controller: bloc.contentController,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.r),
                    child: CustomeButton(
                      text: LocaleKeys.send.tr(),
                      fontSize: 15.sp,
                      textColor: AppColors.whiteApp,
                      pressed: () {
                        // bloc.add(ContactUsEvent());
                      },
                      width: 312.w,
                      height: 54.h,
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ]),
      // floatingActionButtonLocation: ,
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
