import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic_layer/Providers/AddPositionProvider.dart';

class MapWidget extends StatefulWidget {
  List<String> locations;
  bool isAddLocation;
  MapWidget({super.key, required this.locations, required this.isAddLocation});

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
    var addlocatioPro =
        Provider.of<AddPositionProvider>(context, listen: false);
    addlocatioPro.disposeProvider();
    return Consumer<AddPositionProvider>(
      builder: (context, state, _) {
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
                        29.996926408571277,
                        30.96570305129382),
                    zoom: 19.151926040649414,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers:
                      Set.from(widget.isAddLocation ? state.markers : markers),
                  onTap: ((data) =>
                      widget.isAddLocation ? state.handleTap(data) : null),
                )));
      },
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
