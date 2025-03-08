import 'package:flutter/material.dart';
import '../model/favorite_model.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        padding: EdgeInsets.all(16),
        child: Favorite.favorites.isEmpty 
            ? Center(child: Text("Your Favorite is empty"))
            : ListView.builder(
                itemCount: Favorite.favorites.length,  // Get the count of items in the cart
                itemBuilder: (context, index) {
                  final product = Favorite.favorites[index]; // Get the individual product
                  return ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image.network(product.imageUrl)),  // Use the 'imageUrl' of the product
                    title: Text(product.title),  // Use the 'title' of the product
                    subtitle: Text('ETB ${product.price.toStringAsFixed(2)}'),  // Display the price
                    trailing: IconButton(
                      icon: Icon(Icons.delete,color: Colors.redAccent,),
                      onPressed: () {
                        // Remove the item from the cart when clicked
                        Favorite.removeItem(product);
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
