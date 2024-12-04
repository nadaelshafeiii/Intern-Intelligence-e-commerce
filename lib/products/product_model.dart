import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String? description;  // Add description field
  int quantity;
  String? color;  // Add the color field to store the selected color

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    this.description,
    this.quantity = 1,
    this.color = 'Grey',  // Default color (you can change this)
  });

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ imageUrl.hashCode ^ description.hashCode ^ color.hashCode; // Updated hashCode to include color
}




class ProductProvider with ChangeNotifier {
  List<Product> _cartProducts = [];
  List<Product> _favoriteProducts = [];

  List<Product> get cartProducts => _cartProducts;
  List<Product> get favoriteProducts => _favoriteProducts;

void addToCart(Product product, {int quantity = 1}) {
  bool productExistsInCart = _cartProducts.any((p) => p.name == product.name && p.color == product.color);
  if (!productExistsInCart) {
    product.quantity = quantity;
    _cartProducts.add(product);
  } else {
    int index = _cartProducts.indexWhere((p) => p.name == product.name && p.color == product.color);
    _cartProducts[index].quantity += quantity;
  }
  notifyListeners();
}


  void toggleFavorite(Product product) {
    if (_favoriteProducts.contains(product)) {
      _favoriteProducts.remove(product);
    } else {
      _favoriteProducts.add(product);
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartProducts.remove(product);
    notifyListeners();
  }

    void removeFromFavorites(Product product) {
    _favoriteProducts.remove(product);
    notifyListeners();
  }
}