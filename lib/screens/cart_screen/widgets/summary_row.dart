import 'package:ecommerce_app/screens/cart_screen/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

Widget summaryRow(
  String title,
  double value, {
  bool isTotal = false,
  bool isShipping = false,
}) {
  return BlocBuilder<CartBloc, CartState>(
    builder: (context, state) {
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
          isShipping
              ? Text(
                  '\$40',
                  style: GoogleFonts.poppins(
                    fontSize: isTotal ? 17 : 15,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : Text(
                  '\$${isTotal ? state.total : state.subTotal}',
                  style: GoogleFonts.poppins(
                    fontSize: isTotal ? 17 : 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ],
      );
    },
  );
}
