import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

List<String> newArrivalQuotes = ["BEST CHOICE", "MOST SOLD", "TOP RATED"];
List<String> shoeNames = ["Nike Jordan", "Nike Air Max", "Adidas Nitro"];
const List<String> brands = ['Nike', 'Adidas', 'Puma', 'Crocs', 'Fila'];

final List<Product> cartItems = [
  Product(
    name: 'Nike Club Max',
    price: 64.95,
    size: 'L',
    quantity: 1,
    image: 'assets/img/s1.png',
    colors: [Colors.yellow, Colors.greenAccent, Colors.blueAccent],
  ),
  Product(
    name: 'Nike Air Max 200',
    price: 64.95,
    size: 'XL',
    quantity: 1,
    image: 'assets/img/s2.png',
    colors: [Colors.grey],
  ),
  Product(
    name: 'Nike Air Max',
    price: 64.95,
    size: 'XXL',
    quantity: 1,
    image: 'assets/img/s3.png',
    colors: [Colors.yellow, Colors.lightBlue],
  ),
  Product(
    name: 'Puma Nitro',
    price: 57.6,
    image: 'assets/img/s4.png',
    colors: [Colors.teal, Colors.indigoAccent],

    size: 'XXL',
    quantity: 1,
  ),
];
