import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../shared/core/location_helper.dart';
import '../../../shared/widgets/button.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, required this.onConfirm}) : super(key: key);

  final Function(LatLng latLng, String dascription) onConfirm;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // final bloc = KiwiContainer().resolve<SignupBloc>();

  final myMarkers = <Marker>{};
  LatLng? latlng;
  String? address;

  @override
  void initState() {
    //_determinePosition();
    LocationHelper.i.getCurrentLocation().then((value) {
      if (value != null) {
        _goToTheLake(value);
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        // on tap to change marker place .. has argument(lat , lng )
        onTap: (argument) async {
          _goToTheLake(argument);
          // myMarkers.clear();
          // myMarkers.add(Marker(
          //     markerId: const MarkerId("2"),
          //     position: argument,
          //     infoWindow: InfoWindow(title: address)));
          // setState(() {
          //   lat = argument.latitude;
          //   lng = argument.longitude;
          // });
          // final placeMarks = await placemarkFromCoordinates(
          //     argument.latitude, argument.longitude);
          // address = placeMarks[1].street;
        },
        initialCameraPosition:
            const CameraPosition(target: LatLng(24.755562, 46.589584), zoom: 8),
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
        markers:{
          Marker(
              markerId: const MarkerId('loc1'),
              position: latlng??LatLng(0,0),
              infoWindow: InfoWindow(
                title: address ?? "location",
              ),
              onTap: () {
                print(address);
              }),
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(40.0),
        child: CustomButton(
          text: 'confirm Location',
          pressed: () async {
            if (latlng != null) {
              Navigator.pop(context);
              final desc = await LocationHelper.i.getAddress(latlng!);
              widget.onConfirm(latlng!, desc);
            }else{
             /// Toast.show(msg, context)
            }
          },
        ),
      ),
      // floatingActionButton: Visibility(
      //   visible: lat == null ? false : true,
      //   child: Container(
      //     width: 80.w,
      //     height: 50.h,
      //     child: FloatingActionButton(
      //       shape: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(10.r),
      //       ),
      //       onPressed: () {
      //         Navigator.pop(context, [lat, lng, address]);
      //       },
      //       child: Text(
      //         LocaleKeys.confirm.tr(),
      //       ),
      //     ),
    );
  }

  Future<void> _goToTheLake(LatLng latlng) async {
    this.latlng = latlng;
    // myMarkers[0]=
    // {
    //   Marker(
    //       markerId: const MarkerId('loc1'),
    //       position: latlng,
    //       infoWindow: InfoWindow(
    //         title: address ?? "location",
    //       ),
    //       onTap: () {
    //         print(address);
    //       }),
    // };

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(zoom: 14, target: latlng)));
    setState(() {});
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       return Future.error('Location services are disabled.');
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//
//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     return await Geolocator.getCurrentPosition();
//   }
// }
}
