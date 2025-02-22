import "package:json_annotation/json_annotation.dart";

part "product.g.dart";

@JsonSerializable()
class Product {
  late int id;
  String title;
  double price;
  late String description;
  List<String> images;
  late String creationAt;
  late String updatedAt;
  late Map<String, dynamic> category;


  Product({required this.title, required this.price, required this.images});

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }
}
