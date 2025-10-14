import 'package:ecommerce_app/screens/cart_screen/widgets/summary_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget summarySection(double subtotal, double shipping, double total) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, -2),
        ),
      ],
    ),
    child: Column(
      children: [
        summaryRow('Subtotal', subtotal),
        const SizedBox(height: 10),
        summaryRow('Shipping', shipping, isShipping: true),
        const Divider(height: 25, thickness: 1, color: Color(0xFFEAEAEA)),
        summaryRow('Total Cost', total, isTotal: true),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5C9DFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Checkout',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
