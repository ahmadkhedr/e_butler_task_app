import '../Models/RemoteModels/SingleUserModel.dart';
import '../Resourses/UsersApiProvider.dart';

class SingleUserRepository {
  final usersApiProvider = UsersApiProvider();

  Future<SingleUserModel> getUserData() async {
    return await usersApiProvider.getUserData();
  }

  Future<String> updateUserData(String userId)  {
    return  usersApiProvider.updateUserData(userId);
  }
}
