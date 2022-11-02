// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../data_layer/Models/RemoteModels/UserModel.dart';

class UserItem extends StatelessWidget {
  UserModel user;
  UserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xFFD1E8F9),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name!,
                  style: TextStyle(fontSize: 20.sp),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 40.w),
                    child: Text(
                      user.description!,
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:8.0,bottom: 8.0),
                  child: Container(
                    width: 30.w,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFEE5E5),
                    ),
                    child: Center(
                        child: Text(
                      "Add Location",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                )
              ],
            ),
            CachedNetworkImage(
              imageUrl: "user.avatar!",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  Icon(Icons.person, size: 40.0),
            ),
          ]),
    );
  }
}
