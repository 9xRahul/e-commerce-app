import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget brandButton(
  String name,
  int selectedIndex,
  int index, {
  bool isSelected = false,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 0),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF5C9DFF) : const Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(30),
        border: isSelected
            ? Border.all(color: const Color(0xFF5C9DFF), width: 1.5)
            : null,
      ),
      child: Row(
        children: [
          Image.asset('assets/img/${index + 1}.png', height: 25),
          Text(
            name,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  );
}
