import 'package:dars_6_uy_ishi/models/user.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  User user;
  UserWidget({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: 160,
            child: Image.network(
              user.avatar,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            user.email,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
