import 'package:ecommerce_app/screens/product_detail/widgets/checkout_button.dart';
import 'package:ecommerce_app/screens/product_detail/widgets/gallery_item.dart';
import 'package:ecommerce_app/screens/product_detail/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatefulWidget {
  String path;
  ProductDetailScreen({super.key, required this.path});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _selectedSize = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconButton(Icons.arrow_back_ios_new_rounded, () {
                    Navigator.pop(context);
                  }),
                  Text(
                    "Men’s Shoes",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  iconButton(Icons.shopping_bag_outlined, () {}),
                ],
              ),
            ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(widget.path, height: 200),
                  const SizedBox(height: 15),
                ],
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BEST SELLER',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF5C9DFF),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Nike Air Jordan',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$967.800',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Gallery',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        galleryItem('assets/img/s2.png', isSelected: true),
                        galleryItem('assets/img/s3.png'),
                        galleryItem('assets/img/s4.png'),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'Size',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        for (var size in [38, 39, 40, 41, 42, 43])
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedSize = size;
                                  
                                });
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: _selectedSize == size
                                      ? const Color(0xFF5C9DFF)
                                      : const Color(0xFFF5F6FA),
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  size.toString(),
                                  style: GoogleFonts.poppins(
                                    color: _selectedSize == size
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),

                    const Spacer(),

                    checkoutButton(),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
