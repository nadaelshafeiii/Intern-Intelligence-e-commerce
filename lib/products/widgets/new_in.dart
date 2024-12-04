// new_in_products.dart
import 'package:flutter/material.dart';

// Dummy product model (you can replace this with real data later)
class Product1 {
  final String name;
  final double price;
  final String imageUrl;

  Product1({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

class NewInProducts extends StatelessWidget {
  final List<Product1> newInProducts = [
    Product1(name: "V-neck dress", price: 150.00, imageUrl: 'https://media.alshaya.com/adobe/assets/urn:aaid:aem:b31a71e2-adb1-4a2f-8a8a-d68d4d8e6756/as/EID-1a13ea09cc88554ba1f305adeed2d9dc26b47eff.jpg?width=420&height=630&preferwebp=true'),
    Product1(name: "Black jeans", price: 99.99, imageUrl: 'https://media.alshaya.com/adobe/assets/urn:aaid:aem:648db2d6-a5ae-4f02-a954-34e58d4e11c4/as/EID-16a6352c6c088742fa26503dbdcd7f366c3a93ca.jpg?width=450&height=675&preferwebp=true'),
    Product1(name: "Pointed ankle boots", price: 49.99, imageUrl: 'https://media.alshaya.com/adobe/assets/urn:aaid:aem:c85f3e28-1956-4a32-aad9-9c981e561663/as/EID-e8d827b47ecbc469f2e37a9c7706865173d5fc76.jpg?width=420&height=630&preferwebp=true'),
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
                "New In",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Handle "View All" button click
                  print("View all new products clicked");
                },
                child: const Text(
                  "View All",
                  style: TextStyle(color: Colors.white, decoration: TextDecoration.underline,),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newInProducts.length,
              itemBuilder: (context, index) {
                Product1 product = newInProducts[index];
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
