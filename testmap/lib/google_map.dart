import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(31.4176324, 31.7872976),
    zoom: 9.0,
  );

  List<Marker> _markers = [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(31.4176324, 31.7872976),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(31.3276115, 31.6961512),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(31.2068325, 31.6305286),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
    ),
  ];
  List<Circle> _circles = [
    Circle(
    circleId: CircleId('1'),
    center:  LatLng(31.4176324, 31.7872976),
    radius: 4000,
),
 Circle(
    circleId: CircleId('2'),
    center:  LatLng(31.3276115, 31.6961512),
    radius: 4000,
),
 Circle(
    circleId: CircleId('3'),
    center:  LatLng(31.2068325, 31.6305286),
    radius: 4000,
),
  ];

Polyline _polyline = Polyline(
  polylineId: PolylineId('1'),
  points: [
    LatLng(31.0413814,31.3478201),
    LatLng(30.969614,31.1480611),
    LatLng(30.7930351,30.964337),
  ],
  );
 
 Polygon _polygon = Polygon(
  polygonId: PolygonId('1'),
  points: [
    LatLng(30.4589125,31.1534021),
    LatLng(30.0178476,31.4174198),
    LatLng(29.9418829,30.7424829),
  ],
  );
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _initialCameraPosition,
      markers: _markers.toSet(),
      circles: _circles.toSet(),
      polylines: [
        _polyline,
      ].toSet(),
      polygons: [
        _polygon
      ].toSet(),
      mapType: MapType.hybrid,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
     
    );
  }
}
