import 'package:ecommerce_app/constants/text_config.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/screens/fav_screen/bloc/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _iconButton(Icons.arrow_back_ios_new_rounded, () {
                        // Navigator.pop(context);
                      }),
                      Text(
                        'Favourite',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      _iconButton(Icons.favorite_border_outlined, () {}),
                    ],
                  ),

                  const SizedBox(height: 20),

                  state.favouriteList.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 150),
                            Image(image: AssetImage("assets/img/nofav.jpg")),
                          ],
                        )
                      : Expanded(
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15,
                                  childAspectRatio: 0.8,
                                ),
                            itemCount: state.favouriteList.length,
                            itemBuilder: (context, index) {
                              final shoe = state.favouriteList[index];
                              return _favouriteCard(shoe);
                            },
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _favouriteCard(Product shoe) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<FavouriteBloc>().add(
                      AddToFavEvent(id: shoe.id),
                    );
                  },
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                    size: 20,
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Center(child: Image.asset(shoe.image, height: 70)),
            const SizedBox(height: 8),
            Text(
              'BEST SELLER',
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: const Color(0xFF5C9DFF),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              shoe.name,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${shoe.price.toStringAsFixed(1)}',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: shoe.colors!
                      .map(
                        (c) => Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: c,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }
}
