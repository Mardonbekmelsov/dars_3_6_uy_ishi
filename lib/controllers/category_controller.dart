import 'package:dars_6_uy_ishi/models/category.dart';
import 'package:dars_6_uy_ishi/services/categories_http_service.dart';

class CategoryController {
  final categoriesHttpService = CategoriesHttpService();
  Future<List<Categoryy>> getCategories() async {
    List<Categoryy> categories = await categoriesHttpService.getCategories();
    return categories;
  }
}
