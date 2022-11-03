import 'package:e_butler_task/src/configs/AppStrings.dart';
import 'package:e_butler_task/src/data_layer/Models/RemoteModels/SingleUserModel.dart';
import 'package:http/http.dart' as http;

import '../../data_layer/Models/RemoteModels/UserModel.dart';

class UsersApiProvider {
  Future<List<UserModel>> getUsers(String page) async {
    var reponse =
        await http.get(Uri.parse("${AppStrings.baseUel}?page=$page&limit=10"));

    return userModelFromJson(reponse.body);
  }

  Future<SingleUserModel> getUserData() async {
    var response = await http.post(Uri.parse("${AppStrings.baseUel}"));

    return singleUserModelFromJson(response.body);
  }

  Future<String> updateUserData(String userId) async {
    var response = await http.put(Uri.parse("${AppStrings.baseUel}/$userId"));
    print(response.statusCode.toString());
    return response.statusCode.toString();
  }
}
