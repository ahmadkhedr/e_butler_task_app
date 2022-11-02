import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../data_layer/Repositories/LoginRepository.dart';
import '../../data_layer/Validators.dart';


class LoginBloc with Validators {
  final _emailStreamController = BehaviorSubject<String>();
  final _passwordStreamController = BehaviorSubject<String>();

//use getters to set add the value to the sink

  Function(String) get emailChange => _emailStreamController.sink.add;

  Function(String) get changePassword => _passwordStreamController.sink.add;

  //use getters to retrieve the value from the streams

  Stream<String> get emailStream =>
      _emailStreamController.stream.transform(emailValidator);

  Stream<String> get passwordStream =>
      _passwordStreamController.stream.transform(passwordValidator);

  Stream<bool> get submitStream =>
      CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

 submit(BuildContext context) {
  loginRepository.getUserMail(_emailStreamController.value,context);
   
    // print(
    //     "hello ${_emailStreamController.value} ...your password is ${_passwordStreamController.value}");
  }

  dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
  }
}
