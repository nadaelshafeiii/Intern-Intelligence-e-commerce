import 'package:ecommerce_app/products/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartProducts = Provider.of<ProductProvider>(context).cartProducts;

    // Calculate the total price of all products in the cart
    double totalPrice = cartProducts.fold(0.0, (sum, item) {
      return sum + (item.price * item.quantity); // item.price * item.quantity for total price
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',style: TextStyle(color: Colors.white),),
                backgroundColor: const Color.fromARGB(255, 119, 103, 146),
        shadowColor: const Color.fromARGB(255, 242, 240, 246),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: cartProducts.isEmpty
          ? Center(child: Text('No products in the cart.'))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // List of products in the cart
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProducts.length,
                    itemBuilder: (context, index) {
                      Product product = cartProducts[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: ListTile(
                          leading: Image.network(product.imageUrl, width: 60, fit: BoxFit.cover),
                          title: Text(product.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Show selected color
                              Text('Color: ${product.color}'),
                              
                              // Show quantity
                              Text('Quantity: ${product.quantity}'),
                      
                              // Price per item
                              Text('Price: \$${product.price}'),
                      
                              // Total price for this product
                              Text('Total: \$${(product.price * product.quantity).toStringAsFixed(2)}'),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.remove_circle_outline, color: Colors.black.withOpacity(0.5)),
                            onPressed: () {
                              Provider.of<ProductProvider>(context, listen: false)
                                  .removeFromCart(product);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                // Display total price of all items in the cart
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to Checkout page (you can define a CheckoutPage separately)
                          Navigator.pushNamed(context, '/checkout');
                        },
                        child: Text('Checkout'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.2)),
                      ),
                    ],
                  ),
                ),
                
                
              ],
            ),
    );
  }
}
