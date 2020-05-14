import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:testmap/google_map.dart';

main(List<String> args) {
  runApp(
    MaterialApp(
      home: GoogleMaps(),
    )
    );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Location _currentLocation;
  Completer<GoogleMapController> _controller = Completer();
  
 double lat = 0, long =0;

  @override
  void initState() {
    super.initState();

    _currentLocation = Location();

    _currentLocation.getLocation();
    _currentLocation.onLocationChanged.listen((event) {
      setState(() {
        lat = event.latitude;
        long = event.longitude;
      });
    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _currentLocation.getLocation(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                LocationData d = snapshot.data;
               lat = d.latitude;
               long = d.longitude;
                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(lat, long),
                    zoom: 14.0,
                  ),
                  markers: [
                    Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(lat, long),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRose),
                    ),
                  ].toSet(),
                  mapType: MapType.hybrid,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  onTap: (LatLng l) {
                    setState(() {
                     
                    });
                  },
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      
    );
  }
}
