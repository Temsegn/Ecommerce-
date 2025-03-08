import 'product_model.dart';

class Cart {
  static List<ProductModel> items = [];

  // Add item to cart
  static void addItem(ProductModel product) {
    items.add(product);
  }

  // Remove item from cart
  static void removeItem(ProductModel product) {
    items.remove(product);
  }

  // Get the total number of items in the cart
  static int get itemCount => items.length;
}
