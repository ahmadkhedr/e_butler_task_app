import 'dart:async';

import 'package:rxdart/subjects.dart';

import '../../data_layer/Models/RemoteModels/UserModel.dart';
import '../../data_layer/Repositories/AllUsersRepository.dart';

class AllUsersBloc {
  final _usersController = BehaviorSubject<List<UserModel>>();

  final allUsersRepository = AllUsersRepository();

  Stream<List<UserModel>> get allUsersStream => _usersController.stream;

  getUsers() async {
    final users = await allUsersRepository.getUsers();
    _usersController.sink.add(users);
  }

  // usersTransfrom() {
  //   StreamTransformer<String, String>.fromHandlers(
  //     handleData: (data, sink) {
  //   if (data!=null)
  //   {

  //     sink.add(password);
  //   } else {
  //     sink.addError("Short Password !");
  //   }
  // })
  // }

  dispose() {
    _usersController.close();
  }
}
