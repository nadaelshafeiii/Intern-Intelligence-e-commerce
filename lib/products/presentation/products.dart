import 'package:ecommerce_app/presentation/widgets/cart/add_to_cart.dart';
import 'package:ecommerce_app/presentation/widgets/favorites/addtofavorite.dart';
import 'package:ecommerce_app/products/presentation/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../product_model.dart';

class CategoryProductsPage extends StatelessWidget {
  final String categoryName;

  CategoryProductsPage({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    List<Product> products = getCategoryProducts(categoryName);

    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryName Products',style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 119, 103, 146),
        shadowColor: const Color.fromARGB(255, 242, 240, 246),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite , color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart,color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            Product product = products[index];
            bool isFavorite = Provider.of<ProductProvider>(context)
                .favoriteProducts
                .contains(product);
            bool isInCart = Provider.of<ProductProvider>(context)
                .cartProducts
                .contains(product);

            return GestureDetector(
              onTap: () {
                // Corrected Navigator.push
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(product: product),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Image.network(
                          product.imageUrl,
                          height: 120,
                          width: 180,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8),
                        Text(product.name,
                            style: const TextStyle(fontSize: 16)),
                        Text('\$${product.price}',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .toggleFavorite(product);
                        },
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: IconButton(
                        icon: Icon(
                          isInCart
                              ? Icons.shopping_cart
                              : Icons.shopping_cart_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .addToCart(product);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Product> getCategoryProducts(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'electronics':
        return [
          Product(
              name: 'Samsung Galaxy',
              price: 699.99,
              imageUrl:
                  'https://images.samsung.com/eg/smartphones/galaxy-z-flip6/buy/kv_global_PC_v2.jpg?imbypass=true',
              description:
                  'Samsung Galaxy Z Flip 6, 256GB, 12GB RAM, 5G, Dual SIM - Blue with Galaxy Buds 3 Gift'),
          Product(
            name: 'Laptop',
            price: 1299.99,
            imageUrl:
                'https://btech.com/media/catalog/product/6/4/64710dbd11eb6ae384e4aeae78f071dbd38e9469e0e1211cc0f48752f5f8f33d.jpeg?width=560&height=560&store=en&image-type=image',
          ),
          Product(
            name: 'Headphones',
            price: 199.99,
            imageUrl:
                'https://btech.com/media/catalog/product/z/o/zone-vibe-100-gallery-rose-1_1024x.jpg?width=560&height=560&store=en&image-type=image',
          ),
          Product(
            name: 'Smartwatch',
            price: 299.99,
            imageUrl:
                'https://btech.com/media/catalog/product/m/t/mt3u3ref_vw_34fr_watch-case-45-aluminum-wf_co-removebg-preview.jpg?width=560&height=560&store=en&image-type=image',
          ),
          Product(
            name: 'Camera',
            price: 499.99,
            imageUrl:
                'https://m.media-amazon.com/images/I/61JavBEclHL.__AC_SX300_SY300_QL70_ML2_.jpg',
          ),
          Product(
            name: 'Tablet',
            price: 349.99,
            imageUrl:
                'https://btech.com/media/catalog/product/a/7/a70eb4c0f85c70403ab0ff44b8e6a54ba1a36e64a83112426c42f7715f2af6fd.jpeg?width=560&height=560&store=en&image-type=image',
          ),
          Product(
            name: 'Smartphone',
            price: 699.99,
            imageUrl:
                'https://images.samsung.com/eg/smartphones/galaxy-z-flip6/buy/kv_global_PC_v2.jpg?imbypass=true',
          ),
          Product(
            name: 'Laptop',
            price: 1299.99,
            imageUrl:
                'https://btech.com/media/catalog/product/6/4/64710dbd11eb6ae384e4aeae78f071dbd38e9469e0e1211cc0f48752f5f8f33d.jpeg?width=560&height=560&store=en&image-type=image',
          ),
        ];
      default:
        return [];
    }
  }
}
