import 'package:ecommerce_app/products/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _quantity = 1;
  bool _isZoomedIn = false; // Track zoom state for images
  PageController _mainPageController = PageController();
  PageController _carouselPageController = PageController();
  Timer? _timer;
  
  // List of color options
  List<Color> colorOptions = [
    Colors.transparent,
    Colors.lightBlue,
    Colors.black,
    Colors.white,
    Colors.yellowAccent,
  ];

  // Track selected color index
  int _selectedColorIndex = 0;

  // Map to store images for each color
  Map<int, List<String>> colorImageMap = {
    0: [
      'https://images.samsung.com/eg/smartphones/galaxy-z-flip6/buy/kv_global_PC_v2.jpg?imbypass=true', // Grey images
    ],
    1: [
      'https://images.samsung.com/eg/smartphones/galaxy-z-flip6/buy/product_color_blue_PC_v2.png?imbypass=true', // Blue images
    ],
    2: [
      'https://images.samsung.com/eg/smartphones/galaxy-z-flip6/buy/product_color_blue_PC_v2.png?imbypass=true', // Blue images
    ],
    3: [
      'https://images.samsung.com/eg/smartphones/galaxy-z-flip6/buy/product_color_white_PC_v2.png?imbypass=true', // White images
    ],
    4: [
      'https://images.samsung.com/eg/smartphones/galaxy-z-flip6/buy/product_color_yellow_PC_v2.png?imbypass=true',
'https://images.samsung.com/is/image/samsung/p6pim/eg/sm-f741bzyamea/gallery/eg-galaxy-zflip6-f741-sm-f741bzyamea-544324031?imbypass=true',
'https://images.samsung.com/is/image/samsung/p6pim/eg/sm-f741bzyamea/gallery/eg-galaxy-zflip6-f741-sm-f741bzyamea-544324016?imbypass=true'
    ],
  };

  List<String> productImages = [];

  @override
  void initState() {
    super.initState();
    productImages = colorImageMap[_selectedColorIndex]!; 
    _startImageSlider();
  }

  void _startImageSlider() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_mainPageController.hasClients) {
        int nextPage = (_mainPageController.page!.toInt() + 1) % productImages.length;
        _mainPageController.animateToPage(nextPage, duration: Duration(seconds: 1), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _toggleZoom() {
    setState(() {
      _isZoomedIn = !_isZoomedIn;
    });
  }

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (_quantity > 1) _quantity--;
    });
  }

  void _addToCart() {
    Provider.of<ProductProvider>(context, listen: false).addToCart(widget.product, quantity: _quantity);
  }

  // Function to show the image banner in a scrollable modal
  void _showImageSlider() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          child: Column(
            children: [
              Container(
                height: 250,
                child: PageView.builder(
                  controller: _carouselPageController,  // Using the new PageController for the modal
                  itemCount: productImages.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      productImages[index],
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),
              // Image indicators or navigation
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(productImages.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _carouselPageController.hasClients && _carouselPageController.page!.toInt() == index
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 119, 103, 146),
        shadowColor: const Color.fromARGB(255, 242, 240, 246),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color.fromARGB(255, 29, 6, 69),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _showImageSlider, // Show image banner when clicked
                child: Container(
                  height: _isZoomedIn ? 400 : 200,
                  child: PageView.builder(
                    controller: _mainPageController, // Using the main PageController for the product image view
                    itemCount: productImages.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        productImages[index],
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.product.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                '\$${widget.product.price}',
                style: const TextStyle(fontSize: 20, color: Colors.white70),
              ),
              const SizedBox(height: 16),
              
              // Product Description Section
              widget.product.description != null
                  ? Text(
                      widget.product.description!,
                      style: const TextStyle(fontSize: 16, color: Colors.white70),
                    )
                  : const Text(
                      'No description available',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
              const SizedBox(height: 16),
        
              // Color Selection Section
// Color Selection Section
Text(
  'Select Color:',
  style: TextStyle(fontSize: 16, color: Colors.white70),
),
const SizedBox(height: 8),
Wrap(
  spacing: 10.0,
  children: List.generate(colorOptions.length, (index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColorIndex = index;
          // Update the product color based on the selected color
          widget.product.color = colorOptions[index].toString(); // Update the product's color field
          productImages = colorImageMap[_selectedColorIndex]!; // Update images based on selected color
        });
      },
      child: Container(
        width: 25,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorOptions[index],
          border: Border.all(
            color: _selectedColorIndex == index
                ? Colors.white
                : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }),
),

              const SizedBox(height: 16),
        
              // Quantity Selection Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, color: Colors.white),
                    onPressed: _decreaseQuantity,
                  ),
                  Text('$_quantity', style: const TextStyle(fontSize: 24, color: Colors.white)),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: _increaseQuantity,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Add to Cart Button
              ElevatedButton(
                onPressed: _addToCart,
                child: const Text('Add to Cart', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.8)),
              ),
              const SizedBox(height: 16),
        
              // Continue Shopping Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Continue Shopping', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.8)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
