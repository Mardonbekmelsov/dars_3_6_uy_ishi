import 'dart:convert';

import 'package:dars_6_uy_ishi/models/category.dart';
import 'package:http/http.dart' as http;

class CategoriesHttpService {
  Future<List<Categoryy>> getCategories() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/categories");
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    List<Categoryy> categories = [];

    if (data != null) {
      data.forEach((element) {
        categories.add(Categoryy.fromJson(element));
      });
    }

    return categories;
  }
}
