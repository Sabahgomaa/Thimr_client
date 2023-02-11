//
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import 'cach_helper.dart';
//
//
// class MyCurrentLocation {
//   static Position? myCurrentLocation2;
//   static LatLng? myCurrentLocation;
//   static String? myCurrentLocationCity;
//
//   static Future<bool> getCurrentLocation(context) async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     // Test if location services are enabled.
//     await Geolocator.requestPermission();
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Toast.show("Location services are disabled", context);
//       // LoadingDialog.showSimpleToast('Location services are disabled');
//       // myCurrentLocation = null;
//
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Toast.show("Location permissions are denied", context);
//         // LoadingDialog.showSimpleToast('Location permissions are denied');
//         // myCurrentLocation = null;
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       // LoadingDialog.showSimpleToast('Location permissions are permanently denied, we cannot request permissions');
//       // myCurrentLocation = null;
//     }
//
//     myCurrentLocation2 = await Geolocator.getCurrentPosition();
//     myCurrentLocation =
//         LatLng(myCurrentLocation2!.latitude, myCurrentLocation2!.longitude);
//     if (myCurrentLocation != null) {
//       myCurrentLocationCity = await getAddress(
//           myCurrentLocation!.latitude, myCurrentLocation!.longitude, context);
//       // Timer.periodic(const Duration(minutes: 5), (timer) {
//       //   ServerGate().sendToServer(url: "current_location", body: {
//       //     "lat": MyCurrentLocation.myCurrentLocation!.latitude,
//       //     "lng": MyCurrentLocation.myCurrentLocation!.longitude,
//       //   }).then((value) {
//       //     print("Amr" * 20);
//       //     print(value.response!.data);
//       //   });
//       // });
//     } else {
//       myCurrentLocation = const LatLng(24.7249328, 47.1020293);
//     }
//     return true;
//   }
//
//   static Future<String> getAddress(
//       double lat, double lng, BuildContext context) async {
//     debugPrint("lat:$lat");
//     debugPrint("lng:$lng");
//     List<Placemark> place = await placemarkFromCoordinates(lat, lng,
//         localeIdentifier: CacheHelper.init().getLang());
//     String address = place.first.subAdministrativeArea.toString();
//     var myCurrentLocationDescription = "${place.first.subLocality} - ${place.first.subAdministrativeArea}";
//     debugPrint("address$address");
//     debugPrint("myCurrentLocationDescription$myCurrentLocationDescription");
//     CacheHelper.init().setDefaultAddress(myCurrentLocationDescription);
//     return myCurrentLocationDescription;
//   }
// }