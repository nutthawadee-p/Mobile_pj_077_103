import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(13.740504, 100.507398),
    zoom: 12.0,
  );

  @override
  Widget build(BuildContext context) {
    var markers = {
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(13.786945, 100.476609),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
      ),
      Marker(
        markerId: MarkerId('2'),
        position: LatLng(13.771273, 100.544244),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ),
      Marker(
        markerId: MarkerId('3'),
        position: LatLng(13.748931, 100.459100),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
      Marker(
        markerId: MarkerId('4'),
        position: LatLng(13.763104, 100.507508),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      ),
    };
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            initialCameraPosition: _cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: markers,
          ),
          Positioned(
            top: 16.0,
            left: 16.0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/cat_dec.svg', width: 60, height: 60),
                  SvgPicture.asset('assets/icons/cat_book.svg', width: 60, height: 60),
                  SvgPicture.asset('assets/icons/cat_game.svg', width: 60, height: 60),
                  SvgPicture.asset('assets/icons/cat_fur.svg', width: 60, height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

