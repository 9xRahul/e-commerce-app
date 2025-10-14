import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text textWidget({
  required String text,
  required double fontSize,
  textColor = Colors.grey,

  fontWeight = FontWeight.w100,
}) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    ),
  );
}
