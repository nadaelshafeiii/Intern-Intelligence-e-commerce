import 'package:ecommerce_app/products/presentation/products.dart';
import 'package:flutter/material.dart';
import 'categories_model.dart';

class CategoriesPage extends StatelessWidget {
  final List<Category> categories;

  const CategoriesPage({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap:
                true, // Ensures the GridView only takes as much space as it needs
            physics:
                NeverScrollableScrollPhysics(), // Disables internal scrolling, as it's inside a scrollable widget
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 7.0,
              mainAxisSpacing: 7.0,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              Category category = categories[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CategoryProductsPage(categoryName: category.name),
                      ));
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(category.imageUrl),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category.name,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
