import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationHelper {
  static final i = LocationHelper._();

  LocationHelper._();

  Location _location = Location();

  Future<LatLng?> getCurrentLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData? _locationData;
    // check GPS is opened
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return LatLng(37.43296265331129, -122.08832357078792);

        /// show toast to ask user open GPS
      }
      return null;
    }

    _permissionGranted = await _location.hasPermission();
    //only denied & two times denied
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      // for ever denied
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await _location.getLocation();

    // _locationData.latitude ,_locationData.longitude
    return LatLng(_locationData.latitude ?? 0, _locationData.longitude ?? 0);
  }

  Future<String> getAddress(LatLng latLng) async {
    List<geo.Placemark> place =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    String address = place.first.subAdministrativeArea.toString();
    var myCurrentLocationDescription = "${place.first.street}";
    debugPrint("address$address");
    debugPrint("myCurrentLocationDescription$myCurrentLocationDescription");
    // CacheHelper.init().setDefaultAddress(myCurrentLocationDescription);
    return myCurrentLocationDescription;
  }
}
