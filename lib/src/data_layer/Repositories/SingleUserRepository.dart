import '../Models/RemoteModels/SingleUserModel.dart';
import '../Resourses/UsersApiProvider.dart';

class SingleUserRepository {
  final usersApiProvider = UsersApiProvider();

  Future<SingleUserModel> getUserData(String userId) async {
    return await usersApiProvider.getUserData(userId);
  }

  Future<String> updateUserData(String userId)  {
    return  usersApiProvider.updateUserData(userId);
  }
}
