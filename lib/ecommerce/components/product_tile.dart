import 'package:flutter/material.dart';
import '../model/product_model.dart';
import '../model/favorite_model.dart'; // Import your FavoriteModel

class ProductTile extends StatelessWidget {
  final ProductModel shoes;
  final VoidCallback onAddToCart;
  final VoidCallback onAddToFavorites; // Add this line

  const ProductTile({
    super.key,
    required this.shoes,
    required this.onAddToCart,
    required this.onAddToFavorites, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: 250,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 🖼️ Product Image with Favorite Icon
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  shoes.imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Favorite Icon (Top-Right Corner)
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  icon: Icon(
                    // Check if the product is in favorites
                    Favorite.favorites.contains(shoes)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: onAddToFavorites,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),

          // 🏷️ Product Title
          Text(
            shoes.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 5),

          // 📜 Description (Shortened)
          Text(
            shoes.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(height: 8),

          // 💲 Price & Add to Cart Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 💰 Price
              Text(
                "ETB ${shoes.price.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),

              // 🛒 Add to Cart Button
              ElevatedButton(
                onPressed: onAddToCart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.shopping_cart, size: 18, color: Colors.white),
                    SizedBox(width: 5),
                    Text("Add", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}