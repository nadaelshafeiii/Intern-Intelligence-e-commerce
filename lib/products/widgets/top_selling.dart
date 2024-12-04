// top_selling_products.dart

import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

class TopSellingProducts extends StatelessWidget {
  final List<Product> topSellingProducts = [
    Product(
        name: "Smartphone",
        price: 7000,
        imageUrl:
            'https://opsg-img-cdn-gl.heytapimg.com/epb/202407/26/TaMP5ogUFuQFtKFr.png'),
    Product(
        name: "Buccellati",
        price: 1999.99,
        imageUrl:
            'https://www.buccellati.com/media/catalog/product/cache/13355748cb5aa0173d79e20f6c8b2bb4/J/A/JAUBRA023510_V1xxl_2.png'),
    Product(
        name: "Smartphone",
        price: 7000,
        imageUrl:
            'https://opsg-img-cdn-gl.heytapimg.com/epb/202407/26/TaMP5ogUFuQFtKFr.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Top Selling Products",
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Handle "View All" button click
                  print("View all top selling products clicked");
                },
                child: const Text(
                  "View All",
                  style: TextStyle(color: Colors.white,decoration: TextDecoration.underline,),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topSellingProducts.length,
              itemBuilder: (context, index) {
                Product product = topSellingProducts[index];
                return GestureDetector(
                  onTap: () {
                    // Handle tap on product
                    print('Tapped on ${product.name}');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white, // White background
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8), // Rounded corners for the image
                            child: Image.network(
                              product.imageUrl,
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product.name,
                            style: const TextStyle(color: Colors.black),
                          ),
                          Text(
                            "\$${product.price}",
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
