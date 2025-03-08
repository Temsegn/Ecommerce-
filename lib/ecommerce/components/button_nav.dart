import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ButtonNav extends StatelessWidget {
  final Function(int)? onTapChange;

  const ButtonNav({super.key, required this.onTapChange});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GNav(
        gap: 8,
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 12, 154, 236),
        activeColor: Colors.white,
        tabBackgroundColor: Colors.grey[800]!,
        padding: const EdgeInsets.all(10),
        onTabChange: (value) => onTapChange?.call(value),
        tabs: const [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.shopping_cart, text: 'Cart'),
          GButton(icon: Icons.favorite, text: 'Favorites'),
        ],
      ),
    );
  }
}
