import 'package:ecommerce_app/categories/categories_model.dart';
import 'package:ecommerce_app/categories/category.dart';
import 'package:ecommerce_app/presentation/widgets/cart/add_to_cart.dart';
import 'package:ecommerce_app/products/widgets/new_in.dart';
import 'package:ecommerce_app/products/widgets/top_selling.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/presentation/widgets/search/presentation/serch_widgets.dart';
import 'package:ecommerce_app/presentation/widgets/header/presentation/header_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        onCartPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  CartPage()),
          );
        },
      ),
      backgroundColor: const Color.fromARGB(255, 29, 6, 69),
      body: SingleChildScrollView(  // Use SingleChildScrollView to allow scrolling of the entire content
        child: Column(
          children: [
            const SearchFieldWidget(),
            const SizedBox(height: 16),
            CategoriesPage(categories: Category.getCustomCategories()),
            const SizedBox(height: 16),
            TopSellingProducts(),
            const SizedBox(height: 16),
            NewInProducts(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
