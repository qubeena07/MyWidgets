import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_google_street_view/flutter_google_street_view.dart';

class StreetViewPanoramaInitDemo extends StatefulWidget {
  const StreetViewPanoramaInitDemo({super.key});

  @override
  State<StatefulWidget> createState() => _StreetViewPanoramaInitDemoState();
}

class _StreetViewPanoramaInitDemoState
    extends State<StreetViewPanoramaInitDemo> {
  Uint8List? _bluePoint;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Street View Init Demo'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              FlutterGoogleStreetView(
                initPos: const LatLng(13.007488, 77.598656),
                initSource: StreetViewSource.outdoor,
                initBearing: 30,
                zoomGesturesEnabled: false,
                markers: <Marker>{
                  Marker(
                    icon: _bluePoint == null
                        ? BitmapDescriptor.defaultMarker
                        : BitmapDescriptor.fromBytes(_bluePoint!),
                    markerId: const MarkerId("0"),
                    position: const LatLng(37.769263, -122.450727),
                    onTap: () {
                      if (_bluePoint == null) {
                        DefaultAssetBundle.of(context)
                            .load("assets/images/ic_dot.png")
                            .then((data) {
                          setState(() {
                            _bluePoint = data.buffer.asUint8List();
                          });
                        });
                      } else {
                        setState(() => _bluePoint = null);
                      }
                    },
                  )
                },
                onStreetViewCreated: (StreetViewController controller) async {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
