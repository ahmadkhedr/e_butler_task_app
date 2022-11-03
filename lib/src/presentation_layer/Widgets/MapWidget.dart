import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

class MapWidget extends StatefulWidget {
  List<String> locations;
  MapWidget({super.key, required this.locations});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  List<Marker> markers = [];

  Completer<GoogleMapController> _controller = Completer();

  setMarkers() {
    widget.locations.length >= 2
        ? markers.add(Marker(
            markerId: MarkerId('Marker'),
            position: LatLng(double.parse(widget.locations[0]),
                double.parse(widget.locations[1]))))
        : null;
  }

  @override
  void initState() {
    setMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.h,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapType: MapType.normal,
          mapToolbarEnabled: true,
          myLocationEnabled: true,
          zoomGesturesEnabled: true,
          // ignore: prefer_const_constructors
          initialCameraPosition: CameraPosition(
            // ignore: prefer_const_constructors
            target: LatLng(
              //29.996926408571277, 30.96570305129382
             29.996926408571277 , 30.96570305129382),
            zoom: 19.151926040649414,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: Set.from(markers),
        ),
      ),
    );
  }

  Future<void> _goToThePossition(LatLng latlongPostion) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        bearing: 192.8334901395799,
        target: latlongPostion,
        zoom: 19.151926040649414)));
  }
}
