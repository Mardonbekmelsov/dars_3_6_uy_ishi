import 'dart:convert';

import 'package:dars_6_uy_ishi/models/user.dart';
import 'package:http/http.dart' as http;

class UsersHttpService {
  Future<List<User>> getUsers() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/users");
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    List<User> users = [];

    if (data != null) {
      data.forEach((element) {
        users.add(User.fromJson(element));
      });
    }
    return users;
  }
}
