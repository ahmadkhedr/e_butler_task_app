// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../data_layer/Models/RemoteModels/UserModel.dart';
import '../Widgets/MapWidget.dart';
import '../Widgets/UserItem.dart';

class UserDetailsScreen extends StatelessWidget {
  UserModel user;
  UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 5.h, right: 1.sp, left: 1.sp, bottom: 5.h),
                child: Text(
                  "Details",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              UserItem(
                isDetails: true,
                user: user,
              ),
              MapWidget(
                locations: user.location!,
                isAddLocation: false,
              ),
              Text(
                "Location List",
                style: TextStyle(fontSize: 20.sp),
              ),
              user.location!.length >= 2
                  ? ListView.builder(
                      itemCount: user.location!.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                            padding:  EdgeInsets.only(top:3.h,bottom: 2.h),
                          child: Container(
                            child: Column(children: [
                              Text(
                                "Location # ${index + 1}",
                                style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold),
                              ),
                              Text( user.location![index], style: TextStyle(fontSize: 17.sp),)
                            ]),
                          ),
                        );
                      })
                  : Padding(
                      padding:  EdgeInsets.only(top:3.h,bottom: 2.h),
                    child: Center(
                        child: Text(
                            "You Don not Have Any Locations To be Displayed")),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
