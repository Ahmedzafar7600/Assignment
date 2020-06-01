import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyMap();
  }
}

class _MyMap extends State<MyMap> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.664435, 73.0500991),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(33.664435, 73.0500991),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(Marker(
        markerId: MarkerId("1"),
        position: LatLng(33.664435, 73.0500991),
        infoWindow: InfoWindow(
            title:
                "Service Rd N, I-9/3 I 9/3 I-9, Islamabad, Islamabad Capital Territory",
            snippet: "My Location"),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GoogleMap(
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      compassEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: _markers,
    );
  }
}
