import 'dart:collection';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thimar_client/generated/locale_keys.g.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import '../../shared/widgets/app_bar.dart';
import 'components/form_addesses_input.dart';
import 'components/map_screen.dart';

class AddAddress extends StatefulWidget {
  final lat, lang;

  AddAddress({Key? key, this.lat, this.lang}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  var markers = HashSet<Marker>();

  // final bloc = KiwiContainer().resolve<AddressesBloc>();
  // late GoogleMapController googleMapController;
  // late LatLng _center;
  //
  // late Position currentLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //   getUserLocation();
  }

  // Future<Position> locateUser() async {
  //   return Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  // }

  // getUserLocation() async {
  //   currentLocation = await locateUser();
  //   setState(() {
  //     _center = LatLng(currentLocation.latitude, currentLocation.longitude);
  //   });
  //   print('center $_center');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
      appBar: AppBarComponent(
        title: LocaleKeys.addAddress.tr(),
      ),
      body: ListView(children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Container(
              height: 400.h,
              child: GoogleMap(
                onTap: (latlng) {
                  print(latlng);
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.43296265331129, -122.08832357078792),
                  zoom: 10,
                ),
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                // onMapCreated: (GoogleMapController controller) {
                //   googleMapController = controller;
                //   setState(() {
                //     markers.add(
                //       Marker(
                //         markerId: MarkerId('1'),
                //         position: LatLng(37.43296265331129, -122.08832357078792),
                //       ),
                //     );
                //   });
                //},
                markers: markers,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                MagicRouter.navigateTo(MapScreen(
                  onConfirm: (latlng, desc) {

                    print("XOXOOXOXOXOXOXOXOXOXOXO $latlng");
                    print("XOXOXOXOXOXOXOXOXOOXOXXOXO $desc");
                  },
                ));
              },
              backgroundColor: AppColors.green,
            ),
          ],
        ),
        FormAddressesInput(),
      ]),
    );
  }

// Future<Position> _handleLocationPermission() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//
//   if (!serviceEnabled) {
//     return Future.error('Location services are disabled');
//   }
//
//   permission = await Geolocator.checkPermission();
//
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//
//     if (permission == LocationPermission.denied) {
//       return Future.error("Location permission denied");
//     }
//   }
//
//   if (permission == LocationPermission.deniedForever) {
//     return Future.error('Location permissions are permanently denied');
//   }
//
//   Position position = await Geolocator.getCurrentPosition();
//
//   return position;
// }

// LatLng? currentPostion;
//
// void _getUserLocation() async {
//   var position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high);
//
//   setState(() {
//     currentPostion = LatLng(position.latitude, position.longitude);
//   });
// }
}
