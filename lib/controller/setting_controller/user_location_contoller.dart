import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class UserLocationController extends GetxController {
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(21.170240, 72.831062),
    zoom: 14,
  );

  Completer<GoogleMapController> googlecontroller = Completer();
  List<Marker> markers = <Marker>[];
  List<Marker> list = [
    const Marker(
        markerId: MarkerId("1"),
        position: LatLng(21.170240, 72.831062),
        infoWindow: InfoWindow(title: "My Location")),
  ];

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }



  loadData() {
    getUserCurrentLocation().then((value) async {
      List<Placemark> placeMarks = await placemarkFromCoordinates(value.latitude, value.longitude);
      var stADD = "${placeMarks.reversed.last.country} ${placeMarks.reversed.last.subLocality}";
      final Uint8List markerIcon =
          await getBytesFromAsset('assets/image/marker.png', 100);
      update();
      markers.add(
        Marker(
            markerId: const MarkerId("2"),
            icon: BitmapDescriptor.fromBytes(markerIcon),
            position: LatLng(value.latitude, value.longitude),
            infoWindow: InfoWindow(title: stADD)),
      );

      CameraPosition cameraPosition = CameraPosition(
          zoom: 14, target: LatLng(value.latitude, value.longitude));
      final GoogleMapController mapController = await googlecontroller.future;
      mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
    update();
  }

  @override
  void onInit() {
    loadData();
    // TODO: implement onInit
    super.onInit();
  }

  onlaunceMap(LatLng latLng) async {
    await launchUrl(Uri.parse(
        'google.navigation:q=${latLng.latitude}, ${latLng.longitude}&key=AIzaSyBvhSQHQ9JyipIjGEgLqapBksstg9yMbDw'));
  }
}
