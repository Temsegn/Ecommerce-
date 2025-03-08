import 'package:flutter/material.dart';
import '/ecommerce/model/product_model.dart'; 
import '/ecommerce/components/product_tile.dart'; 
import 'shoes_list.dart';
import '../model/cart_model.dart';
import '../model/favorite_model.dart'; 

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  TextEditingController _searchController = TextEditingController();  // Controller for the search input
  List<ProductModel> _filteredShoesList = ShoesList.shoes;  // Initially, display all products

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterSearchResults);  // Listen for changes in the search input
  }

  @override
  void dispose() {
    _searchController.dispose();  // Dispose the controller when no longer needed
    super.dispose();
  }

  // Function to filter the list based on the search query
  void _filterSearchResults() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredShoesList = ShoesList.shoes.where((shoe) {
        return shoe.title.toLowerCase().contains(query);  // Filter shoes by name
      }).toList() +
          ShoesList.shoes.where((shoe) {
        return shoe.description.toLowerCase().contains(query);  // Filter shoes by description
      }).toList() +
          ShoesList.shoes.where((shoe) {
        return shoe.price.toString().contains(query);  // Filter shoes by price
      }).toList();
    });
  }

  // Function to show the "Item added to cart" dialog
  void _showAddToCartDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Item added to cart successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Fixed Search Bar
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,  // Set the controller
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Icon(Icons.search, color: Colors.black54),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Content Section Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hot Products 🐦‍🔥",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("See All", style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
          // Horizontal Scrollable List of Products
          Expanded(
            child: SingleChildScrollView(  // Make the content scrollable
              child: Column(
                children: [
                  SizedBox(height: 20),
                  // Update ListView to horizontal
                  Container(
                    height: 340, // Define the height of the horizontal list
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,  // Set horizontal scroll direction
                      itemCount: _filteredShoesList.length,  // Use filtered list
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ProductTile(
                            shoes: _filteredShoesList[index],  // Display the filtered shoe
                            onAddToCart: () {
                              setState(() {
                                // Add the product to the cart when clicked
                                Cart.addItem(_filteredShoesList[index]);
                              });
                              _showAddToCartDialog();
                            },
                            onAddToFavorites: () {
          setState(() {
            // Add/remove from favorites
            if (Favorite.favorites.contains(_filteredShoesList[index])) {
              Favorite.removeItem(_filteredShoesList[index]);
            } else {
              Favorite.addItem(_filteredShoesList[index]);
            }
          });
        },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
