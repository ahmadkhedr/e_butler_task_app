import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddPositionProvider extends ChangeNotifier {
  bool toggleValue = false;
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();

  List<Marker> markers = [];

  handleTap(LatLng point) {
    markers.isEmpty
        ? markers.add(Marker(
            markerId: MarkerId(point.toString()),
            position: point,
            // ignore: prefer_const_constructors
            infoWindow: InfoWindow(
              title: point.toString(),
            ),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ))
        : null;
    notifyListeners();
  }

  onToggleChanged(bool value) {
    toggleValue = value;
    disposeProvider();
    notifyListeners();
  }

  disposeProvider() {
    markers = [];
    latController.clear();
    longController.clear();
    notifyListeners();
  }
}
