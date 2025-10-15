import 'package:ecommerce_app/constants/text_config.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/screens/cart_screen/bloc/cart_bloc.dart';
import 'package:ecommerce_app/screens/fav_screen/bloc/favourite_bloc.dart';
import 'package:ecommerce_app/screens/product_detail/product_detail_screen.dart';
import 'package:ecommerce_app/screens/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

Widget productCard(Product item, BuildContext? context) {
  return Container(
    width: 160,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<FavouriteBloc>().add(
                        AddToFavEvent(id: item.id),
                      );
                    },
                    child: Icon(
                      state.favouriteList.contains(item)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 20,
                      color: Colors.red,
                    ),
                  ),
                ],
              );
            },
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context!).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(path: item.image),
                ),
              );
            },
            child: Image.asset(item.image, height: 80),
          ),
          const SizedBox(height: 10),
          Text(
            'BEST SELLER',
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: const Color(0xFF5C9DFF),
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            item.name,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${item.price.toString()}",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      print(item.id);
               

                      if (state.cartProducts.contains(item)) {
                        showAppSnackBar(
                          context!,
                          message: "Item removed from cart",
                          backgroundColor: Colors.red,
                        );
                        context.read<CartBloc>().add(
                          DeleteCartItemEvent(index: item.id),
                        );
                      } else {
                        showAppSnackBar(
                          context!,
                          message: "Item Added to cart",
                        );
                        context!.read<CartBloc>().add(
                          AddtoCartEvent(index: item.id),
                        );
                      }
                    },
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: const Color(0xFF5C9DFF),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(14),
                          bottomRight: Radius.circular(14),
                        ),
                      ),
                      child: !state.cartProducts.contains(item)
                          ? const Icon(Icons.add, color: Colors.white, size: 18)
                          : const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 18,
                            ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
