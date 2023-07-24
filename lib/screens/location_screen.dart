import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Location disabled. Please enable the services")));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Location permissions are denied")));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              "Location denied permanently, we cannot request permissions")));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  //open current location in google map
  Future<void> _openMap({required String lat, required String lang}) async {
    final Uri googleUrl =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$lang");
    await canLaunchUrl(googleUrl)
        ? await launchUrlString(googleUrl.toString())
        : throw "Could not launch $googleUrl";
  }

  @override
  Widget build(BuildContext context) {
    log(_currentAddress.toString(), name: "current position");
    log(_currentPosition.toString(), name: "current position");

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("LAT :${_currentPosition?.latitude ?? "0.0"}"),
            Text("LNG :${_currentPosition?.longitude ?? "0.0"}"),
            Text("ADDRESS : ${_currentAddress ?? "No location"}"),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                onPressed: _getCurrentPosition,
                child: const Text("Get Current Location")),
            ElevatedButton(
                onPressed: () {
                  _openMap(
                      lat: _currentPosition?.latitude.toString() ?? "0.0",
                      lang: _currentPosition?.longitude.toString() ?? "0.0");
                },
                child: const Text("Open in google map"))
          ],
        ),
      ),
    );
  }
}
