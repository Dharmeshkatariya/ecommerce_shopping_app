import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shoping/controller/setting_controller/user_location_contoller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetUserCurrentLocationScreen extends GetView<UserLocationController> {
  const GetUserCurrentLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.init(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.loadData();
          },
          child: const Icon(Icons.location_searching_rounded),
        ),
        body: SafeArea(
          child: GoogleMap(
            zoomControlsEnabled: false,
            onTap: (LatLng latLng) {
              print(latLng);
              controller.onlaunceMap(latLng);
            },
            initialCameraPosition: controller.kGooglePlex,
            mapType: MapType.normal,
            markers: Set<Marker>.of(controller.markers),
            compassEnabled: false,
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController cont) {
              controller.googlecontroller.complete(cont);
              cont.setMapStyle(controller.maptheme.value);
            },
          ),
        ),);
  }
}
