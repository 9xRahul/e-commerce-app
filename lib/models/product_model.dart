import 'package:flutter/widgets.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String size;
  int quantity;
  final String image;
  List<Color>? colors;
  int? quatity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.size,
    required this.quantity,
    required this.image,
    this.colors,
    this.quatity = 1,
  });
}
