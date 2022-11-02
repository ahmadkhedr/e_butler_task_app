import '../../data_layer/Models/RemoteModels/UserModel.dart';
import '../Resourses/UsersApiProvider.dart';

class AllUsersRepository {
  UsersApiProvider usersApiProvider = UsersApiProvider();
  int i = 1;
  List data = [];
  Future<List<UserModel>> getUsers() {
    return usersApiProvider.getUsers("${i++}");
  }
}
