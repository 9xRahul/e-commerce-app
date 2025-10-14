import 'package:ecommerce_app/constants/text_config.dart';
import 'package:ecommerce_app/screens/home_screen/widgets/text_widget.dart';
import 'package:ecommerce_app/screens/product_detail/product_detail_screen.dart';
import 'package:flutter/material.dart';

Widget newArrivalCard({
  bool isLeft = false,
  required int id,
  required nameId,
  BuildContext? context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context!).push(
        MaterialPageRoute(
          builder: (context) =>
              ProductDetailScreen(path: 'assets/img/s$id.png'),
        ),
      );
    },
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            isLeft
                ? Image.asset('assets/img/s$id.png', height: 120)
                : SizedBox(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget(
                    fontSize: 20,
                    text: newArrivalQuotes[nameId],
                    textColor: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                  textWidget(
                    fontSize: 18,
                    text: shoeNames[nameId],
                    textColor: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),

                  const SizedBox(height: 4),
                  textWidget(
                    fontSize: 18,
                    text: "\$600",
                    textColor: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            !isLeft
                ? Image.asset('assets/img/s$id.png', height: 120)
                : SizedBox(),
            const SizedBox(width: 10),
          ],
        ),
      ),
    ),
  );
}
