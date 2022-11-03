// ignore_for_file: prefer_const_constructors
// ignore_for_file: file_names

import 'package:e_butler_task/src/configs/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic_layer/Providers/AddPositionProvider.dart';
import '../Widgets/MapWidget.dart';

class AddLocationScreen extends StatelessWidget with Constants {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var addlocatioPro =
        Provider.of<AddPositionProvider>(context, listen: false);

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.h, right: 1.h, left: 1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Add Location",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      showToast("Added Succefully");
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            MapWidget(
              isAddLocation: true,
              locations: [],
            ),
            Consumer<AddPositionProvider>(
              builder: (context, state, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Add Value Manualy"),
                        Switch(
                          onChanged: (value) => state.onToggleChanged(value),
                          value: state.toggleValue,
                        ),
                      ],
                    ),
                    state.toggleValue
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              SizedBox(
                                width: 80.w,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: state.latController,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.0)),
                                      borderSide: BorderSide(width: 0.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    // focusedBorder: OutlineInputBorder(
                                    //   borderSide: BorderSide(color: Colors.blue),
                                    // ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    alignLabelWithHint: true,
                                    suffix: const Icon(
                                      Icons.location_on,
                                      color: Colors.blue,
                                    ),
                                    hintText: 'Lat',
                                  ),
                                  onChanged: (String input) {},
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                                child: SizedBox(
                                  width: 80.w,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: state.longController,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.0)),
                                        borderSide: BorderSide(width: 0.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      // focusedBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(color: Colors.blue),
                                      // ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                      alignLabelWithHint: true,
                                      suffix: const Icon(
                                        Icons.location_on,
                                        color: Colors.blue,
                                      ),
                                      hintText: 'Long',
                                      //label: Text("Your Email Address"),
                                      //  errorText: snapshot.hasError ? snapshot.error.toString() : null
                                    ),
                                    onChanged: (String input) {},
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                    Center(
                      child: ElevatedButton(
                        onPressed: state.latController.text.isEmpty ||
                                state.longController.text.isEmpty
                            ? null
                            : (() {
                                state.markers = [];
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                state.handleTap(LatLng(
                                    double.parse(state.latController.text),
                                    double.parse(state.longController.text)));
                              }),
                        child: Text("Display"),
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
