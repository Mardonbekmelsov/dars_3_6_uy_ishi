import 'package:dars_6_uy_ishi/models/product.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  ProductWidget({required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            width: 105,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(),
            child: Image.network(
              formatImage(product.images[0]),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(
              color: Colors.grey,
            ),
            textAlign: TextAlign.start,
          ),
          Text(
            formatTitle(product.title),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String formatImage(String image) {
    image = image.replaceAll("\\", "");
    image = image.replaceAll("[", "");
    image = image.replaceAll("]", "");
    image = image.replaceAll('"', "");
    return image;
  }

  String formatTitle(String title) {
    if (title.length > 20) {
      return "${title.substring(0, 17)}...";
    } else {
      return title;
    }
  }
}
