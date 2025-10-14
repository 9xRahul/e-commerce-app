import 'package:flutter/material.dart';

Widget galleryItem(String path, {bool isSelected = false}) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    padding: const EdgeInsets.all(6),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: isSelected
          ? Border.all(color: const Color(0xFF5C9DFF), width: 2)
          : Border.all(color: Colors.grey.withOpacity(0.2)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Image.asset(path, height: 40),
  );
}
