import 'package:ecommerce_app/constants/text_config.dart';
import 'package:ecommerce_app/screens/home_screen/widgets/brand_button.dart';
import 'package:ecommerce_app/screens/home_screen/widgets/new_arrival_card.dart';
import 'package:ecommerce_app/screens/home_screen/widgets/product_card.dart';
import 'package:ecommerce_app/screens/home_screen/widgets/text_widget.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedBrandIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.more_vert_rounded, size: 28),
                  Column(
                    children: [
                      textWidget(
                        fontSize: 12,
                        text: "Store Location",
                        fontWeight: FontWeight.w600,
                      ),
                      textWidget(
                        fontSize: 14,
                        text: "Newyork City",
                        textColor: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/img/dp.jpg'),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6FA),
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                    hintText: 'Looking for shoes',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xFF5C9DFF),
                        width: 1.6,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(top: 0),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: brands.length,
                  itemBuilder: (context, index) {
                    final brand = brands[index];
                    final isSelected = _selectedBrandIndex == index;
                    final selectedIndex = index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedBrandIndex = index;
                        });
                      },
                      child: brandButton(
                        brand,
                        index,
                        selectedIndex,
                        isSelected: isSelected,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              _sectionHeader('Popular Shoes'),
              const SizedBox(height: 10),
              _productGrid(),
              const SizedBox(height: 20),
              _sectionHeader('New Arrivals'),
              const SizedBox(height: 10),
              newArrivalCard(isLeft: true, id: 5, nameId: 0, context: context),
              const SizedBox(height: 10),
              newArrivalCard(id: 6, nameId: 1, context: context),
              const SizedBox(height: 10),
              newArrivalCard(isLeft: true, id: 5, nameId: 2, context: context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(
          'See all',
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: const Color(0xFF5C9DFF),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _productGrid() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          productCard(cartItems[1], context),
          productCard(cartItems[0], context),
          productCard(cartItems[2], context),
          productCard(cartItems[3], context),
        ],
      ),
    );
  }
}
