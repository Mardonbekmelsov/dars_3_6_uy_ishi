import 'package:dars_6_uy_ishi/models/user.dart';
import 'package:dars_6_uy_ishi/services/users_http_service.dart';

class UserController {
  final usersHttpService = UsersHttpService();
  Future<List<User>> getUsers() async {
    List<User> users = await usersHttpService.getUsers();
    return users;
  }
}
