import 'package:flutter/material.dart';
import '../model/favorite_model.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Favorite.favorites.isEmpty
            ? Center(child: Text("Your Favorites are empty"))
            : ListView.builder(
                itemCount: Favorite.favorites.length,
                itemBuilder: (context, index) {
                  final product = Favorite.favorites[index];
                  return ListTile(
                    leading: Image.network(product.imageUrl),
                    title: Text(product.title),
                    subtitle: Text('ETB ${product.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        // Update UI with setState
                        setState(() {
                          Favorite.removeItem(product);
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