import 'package:flutter/material.dart';
import '../model/cart_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Cart.items.isEmpty
            ? Center(child: Text("Your Carts are empty"))
            : ListView.builder(
                itemCount: Cart.items.length,
                itemBuilder: (context, index) {
                  final product = Cart.items[index];
                  return ListTile(
                    leading: Image.network(product.imageUrl),
                    title: Text(product.title),
                    subtitle: Text('ETB ${product.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_shopping_cart, color: Colors.redAccent),
                      onPressed: () {
                        // Update UI with setState
                        setState(() {
                          Cart.removeItem(product);
                        });
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}