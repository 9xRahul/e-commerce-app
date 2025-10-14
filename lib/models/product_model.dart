import 'package:flutter/widgets.dart';

class Product {
  final String name;
  final double price;
  final String size;
  int quantity;
  final String image;
  List<Color>? colors;

  Product({
    required this.name,
    required this.price,
    required this.size,
    required this.quantity,
    required this.image,
    this.colors
  });
}
