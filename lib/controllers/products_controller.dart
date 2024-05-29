import 'package:dars_6_uy_ishi/models/product.dart';
import 'package:dars_6_uy_ishi/services/products_http_service.dart';

class ProductsController{

  final productsHttpService=ProductsHttpService();
  Future<List<Product>> getProducts() async {
    List<Product> products = await productsHttpService.getProducts();
    return products;
  }
}