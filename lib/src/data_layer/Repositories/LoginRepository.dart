// ignore_for_file: use_build_context_synchronously

import 'package:e_butler_task/src/configs/Routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../configs/Constants.dart';
import '../../data_layer/Models/LocalModels/DbModel.dart';
import '../Resourses/UsersDBProvider.dart';

class LoginRepository with Constants {
  DbHelper dbHelper = DbHelper();

  Future<DbModel?> getUserMail(String userMail, BuildContext context) async {
    DbModel? item = await dbHelper.getUserMAil(userMail);
    //Map<String, dynamic> value = {};

    if (item != null) {
      print("Found");
      //"Welcome Back ${item.mail}"
      showToast("Welcome Back ${item.mail}");
      Navigator.pushReplacementNamed(context, Routes.mainScreen);

      return item;
    } else {
      print("Not Found and Will be added to the DB");
      showToast("Hi,$userMail You Have Registered Succefully to our app");
      Navigator.pushReplacementNamed(context, Routes.mainScreen);
      dbHelper.addItem(DbModel(mail: userMail));
      //  value = {"isFound": false, "itemone": DbModel(mail: userMail)};
      return item;
    }
  }
}

final LoginRepository loginRepository = LoginRepository();
