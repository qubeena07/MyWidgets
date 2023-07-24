import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationTrackingScreen extends StatefulWidget {
  const LocationTrackingScreen({super.key});

  @override
  State<LocationTrackingScreen> createState() => _LocationTrackingScreenState();
}

class _LocationTrackingScreenState extends State<LocationTrackingScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static LatLng sourceLocation = const LatLng(27.6842783, 85.3167233);
  static LatLng destination = const LatLng(27.6632, 85.36113);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Track order"),
        ),
        body: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: sourceLocation, zoom: 14.5)));
  }
}
