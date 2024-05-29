import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Categoryy {
  int id;
  String name;
  String image;
  String creationAt;
  String updatedAt;

  Categoryy(
      {required this.id,
      required this.name,
      required this.image,
      required this.creationAt,
      required this.updatedAt});

  factory Categoryy.fromJson(Map<String, dynamic> json) {
    return _$CategoryyFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryyToJson(this);
  }
}
