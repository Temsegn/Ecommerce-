import 'package:flutter/material.dart';
import '../model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        padding: EdgeInsets.all(16),
        child: Cart.items.isEmpty 
            ? Center(child: Text("Your cart is empty"))
            : ListView.builder(
                itemCount: Cart.items.length,  // Get the count of items in the cart
                itemBuilder: (context, index) {
                  final product = Cart.items[index]; // Get the individual product
                  return ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image.network(product.imageUrl)),  // Use the 'imageUrl' of the product
                    title: Text(product.title),  // Use the 'title' of the product
                    subtitle: Text('ETB ${product.price.toStringAsFixed(2)}'),  // Display the price
                    trailing: IconButton(
                      icon: Icon(Icons.remove_shopping_cart,color: Colors.redAccent,),
                      onPressed: () {
                        // Remove the item from the cart when clicked
                        Cart.removeItem(product);
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
