import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../data_layer/Repositories/LoginRepository.dart';
import '../../data_layer/Validators.dart';

class LoginBloc with Validators {
  final _emailStreamController = BehaviorSubject<String>();
  final _passwordStreamController = BehaviorSubject<String>();

  Function(String) get emailChange => _emailStreamController.sink.add;

  Function(String) get changePassword => _passwordStreamController.sink.add;

  Stream<String> get emailStream =>
      _emailStreamController.stream.transform(emailValidator);

  Stream<String> get passwordStream =>
      _passwordStreamController.stream.transform(passwordValidator);

  Stream<bool> get submitStream =>
      CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

  submit(BuildContext context) {
    loginRepository.getUserMail(_emailStreamController.value, context);
  }

  dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
  }
}
