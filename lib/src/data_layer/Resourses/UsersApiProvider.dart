import 'package:e_butler_task/src/configs/AppStrings.dart';
import 'package:http/http.dart' as http;

import '../../data_layer/Models/RemoteModels/UserModel.dart';

class UsersApiProvider {
  Future<List<UserModel>> getUsers(String page) async {
    var reponse =
        await http.get(Uri.parse("${AppStrings.baseUel}?page=$page&limit=10"));

    return userModelFromJson(reponse.body);
  }
}
