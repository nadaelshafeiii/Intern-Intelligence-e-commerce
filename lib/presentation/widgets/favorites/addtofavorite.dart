// favorites_page.dart
import 'package:ecommerce_app/products/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favoriteProducts = Provider.of<ProductProvider>(context).favoriteProducts;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 119, 103, 146),
        shadowColor: const Color.fromARGB(255, 242, 240, 246),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: favoriteProducts.isEmpty
          ? Center(child: Text('No favorite products yet.'))
          : ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                Product product = favoriteProducts[index];
                return ListTile(
                  leading: Image.network(product.imageUrl),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle, color: Colors.black.withOpacity(0.5)),
                    onPressed: () {
                      // Remove from favorites when the button is pressed
                      Provider.of<ProductProvider>(context, listen: false)
                          .removeFromFavorites(product);
                    },
                  ),
                );
              },
            ),
    );
  }
}
