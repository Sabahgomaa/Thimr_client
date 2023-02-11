// import 'dart:collection';
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:kiwi/kiwi.dart';
// import 'package:thimar_client/shared/router.dart';
//
// import '../generated/locale_keys.g.dart';
// import '../screens/my_account_pages/addresses/bloc/bloc.dart';
// import '../shared/widgets/app_bar.dart';
// import '../screens/add_address/components/map_screen.dart';
//
// class AddAddressTest extends StatefulWidget {
//   const AddAddressTest({Key? key}) : super(key: key);
//
//   @override
//   State<AddAddressTest> createState() => _AddAddressTestState();
// }
//
// class _AddAddressTestState extends State<AddAddressTest> {
//   var markers = HashSet<Marker>();
//   final bloc = KiwiContainer().resolve<AddressesBloc>();
//   late GoogleMapController googleMapController;
//
//   static const CameraPosition initialCameraPosition = CameraPosition(
//       target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarComponent(
//         title: LocaleKeys.addAddress.tr(),
//       ),
//       body: ListView(
//         children: [
//           GestureDetector(
//             onTap: () {
//               MagicRouter.navigateTo(MapScreen());
//             },
//             child: GoogleMap(
//               initialCameraPosition: initialCameraPosition,
//               zoomControlsEnabled: false,
//               mapType: MapType.normal,
//               onMapCreated: (GoogleMapController controller) {
//                 googleMapController = controller;
//                 setState(() {
//                   markers.add(
//                     Marker(
//                       markerId: MarkerId('1'),
//                       position: LatLng(37.43296265331129, -122.08832357078792),
//                     ),
//                   );
//                 });
//               },
//               markers: markers,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
