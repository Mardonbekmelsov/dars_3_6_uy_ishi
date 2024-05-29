import 'package:dars_6_uy_ishi/models/category.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  Categoryy category;
  CategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 175,
            width: 175,
            child: Image.network(
              category.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            category.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
