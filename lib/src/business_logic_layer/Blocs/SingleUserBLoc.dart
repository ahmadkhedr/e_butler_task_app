import 'package:e_butler_task/src/data_layer/Validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../configs/Constants.dart';
import '../../data_layer/Models/RemoteModels/SingleUserModel.dart';
import '../../data_layer/Repositories/SingleUserRepository.dart';

class SingleUserBLoc with Validators, Constants {
  final _userController = BehaviorSubject<SingleUserModel>();
  final _userMailController = BehaviorSubject<String>();
  final _updateDataController = BehaviorSubject<String>();
  final singleUserRepository = SingleUserRepository();

  Stream<SingleUserModel> get singleUserStream => _userController.stream;

  Stream<String> get userMailStream =>
      _userMailController.stream.transform(nameValidator);

  Stream<String> get updateStream => _updateDataController.stream;

  Function(String) get addMail => _userMailController.sink.add;

  getUserData() async {
    var userData = await singleUserRepository.getUserData();

    _userController.sink.add(userData);
  }

  submitStream(BuildContext context,String userId) async {
    print("Hi");
    if (_userMailController.stream.value.isNotEmpty) {
      var response = await singleUserRepository.updateUserData(userId);
      if (response == "200") {
        showToast("Data Updated Succefully");
        Navigator.pop(context);
      } else {}
      // _updateDataController.sink.add(response);
    } else {}
  }
}