import '../model/product_model.dart';

class Favorite {
  static List<ProductModel> favorites = [];

  static void addItem(ProductModel product) {
    if (!favorites.contains(product)) {
      favorites.add(product);
    }
  }

  static void removeItem(ProductModel product) {
    favorites.remove(product);
  }
}