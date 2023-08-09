import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationTrackingScreen extends StatefulWidget {
  const LocationTrackingScreen({super.key});

  @override
  State<LocationTrackingScreen> createState() => _LocationTrackingScreenState();
}

class _LocationTrackingScreenState extends State<LocationTrackingScreen> {
  CameraPosition? _cameraPosition;
  Location? _location;
  LocationData? _currentLocation;

  final Completer<GoogleMapController> _googleMapController = Completer();
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    _location = Location();
    _cameraPosition = const CameraPosition(
      target: LatLng(
        0, 0,
        // currentLocation?.latitude ?? 0,
        // currentLocation?.longitude ?? 0,
        // 27.6842802,
        // 85.3141463,
      ),
      zoom: 15,
    );
    _initLocation();
    // LocationData? currentLocation = await _getCurrentLocation();
    // moveToCurrentLocation();
  }

// function tolisten when we move position
  _initLocation() {
    _location?.getLocation().then((value) {
      _currentLocation = value;
    });
    _location?.onLocationChanged.listen((event) {
      _currentLocation = event;
      moveToPosition(LatLng(
        _currentLocation?.latitude ?? 0,
        _currentLocation?.longitude ?? 0,
      ));
    });
  }

  // Future<LocationData?> _getCurrentLocation() async {
  //   var currentLocation = await _location?.getLocation();
  //   return currentLocation;
  // }

  // moveToCurrentLocation() async {
  //   LocationData? currentLocation = await _getCurrentLocation();
  //   moveToPosition(LatLng(
  //     currentLocation?.latitude ?? 0,
  //     currentLocation?.longitude ?? 0,
  //   ));
  // }

  moveToPosition(LatLng latlng) async {
    GoogleMapController mapController = await _googleMapController.future;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latlng,
          zoom: 18,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _getMap();
  }

  Widget _getMarker() {
    return
        // Container(
        //   height: 30,
        //   width: 30,
        //   decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(100),
        //       boxShadow: const [
        //         BoxShadow(
        //           color: Colors.grey,
        //           offset: Offset(0, 3),
        //           spreadRadius: 4,
        //           blurRadius: 6,
        //         )
        //       ]),
        //   child: const
        const Icon(
      Icons.pin_drop_rounded,
      size: 35,
      color: Colors.greenAccent,
    );
    // );
  }

  Widget _getMap() {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _cameraPosition!,
          // mapType: MapType.none,
          onMapCreated: (GoogleMapController controller) {
            // now we need a variable to get the controller of google
            if (!_googleMapController.isCompleted) {
              _googleMapController.complete(controller);
            }
          },
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: _getMarker(),
          ),
        ),
      ],
    );
  }
}
