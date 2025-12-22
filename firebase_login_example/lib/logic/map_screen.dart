import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Location location = Location();
  GoogleMapController? mapController;

  late StreamSubscription<LocationData> locationSubscription;

  static const LatLng pGooglePlex = LatLng(
    18.477142987217462,
    73.93468314292424,
  );

  LatLng currentLatLng = pGooglePlex;

  @override
  void initState() {
    super.initState();
    initLiveLocation();
  }

    Future<void> initLiveLocation() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return;
    }

    PermissionStatus permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) return;
    }

    locationSubscription = location.onLocationChanged.listen((
      LocationData data,
    ) {
      if (data.latitude == null || data.longitude == null) return;

      currentLatLng = LatLng(data.latitude!, data.longitude!);

      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: currentLatLng, zoom: 17),
        ),
      );

      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    locationSubscription.cancel();
    mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Google Map',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: currentLatLng, zoom: 14),
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (controller) {
          mapController = controller;
        },
      ),
    );
  }
}
