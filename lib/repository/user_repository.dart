import 'package:techno_gadgets/api/user_api.dart';

import '../model/user.dart';

class UserRepository {
  Future<bool> registerUser(User user) async {
    return await UserAPI().registerUser(user);
  }

  Future<bool> login(String username, String password) {
    return UserAPI().login(username, password);
  }
}
