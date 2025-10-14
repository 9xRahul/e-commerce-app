import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget summaryRow(String title, double value, {bool isTotal = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.grey[700],
          fontSize: 15,
          fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
      Text(
        '\$${value.toStringAsFixed(2)}',
        style: GoogleFonts.poppins(
          fontSize: isTotal ? 17 : 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
