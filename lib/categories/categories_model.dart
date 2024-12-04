import 'package:ecommerce_app/products/widgets/top_selling.dart';

class Category {
  final String name;
  final String imageUrl;
  final List<Product> products;

  Category({
    required this.name,
    required this.imageUrl,
    required this.products,
  });

  static List<Category> getCustomCategories() {
    return [
      Category(
        name: "Electronics",
        imageUrl:
            'https://cdn.coinsbee.com/dist/assets/img/category/electronics.webp',
        products: [
          Product(
            name: "Samsung Galaxy Z Flip 6",
            price: 999.99,
            imageUrl:
                'https://cdn.icon-icons.com/icons2/1851/PNG/512/makeup_116527.png',
          ),
          Product(
            name: "Laptop",
            price: 1999.99,
            imageUrl:
                'https://example.com/laptop.png', // Add imageUrl for product
          ),
        ],
      ),
      Category(
        name: "Jewelry",
        imageUrl:
            'https://www.shutterstock.com/shutterstock/photos/1781577608/display_1500/stock-vector-jewelry-rgb-color-icon-female-luxury-accessories-shopping-mall-category-elegant-necklace-and-1781577608.jpg',
        products: [
          Product(
            name: "Gold Necklace",
            price: 499.99,
            imageUrl:
                'https://example.com/gold-necklace.png', // Add imageUrl for product
          ),
          Product(
            name: "Diamond Ring",
            price: 2999.99,
            imageUrl:
                'https://example.com/diamond-ring.png', // Add imageUrl for product
          ),
        ],
      ),
      Category(
        name: "Clothing",
        imageUrl:
            'https://cdn2.iconfinder.com/data/icons/household-appliances-8/64/clothing-512.png',
        products: [
          Product(
            name: "T-Shirt",
            price: 29.99,
            imageUrl:
                'https://example.com/t-shirt.png', // Add imageUrl for product
          ),
          Product(
            name: "Jeans",
            price: 49.99,
            imageUrl:
                'https://example.com/jeans.png', // Add imageUrl for product
          ),
          Product(
            name: "Dress",
            price: 89.99,
            imageUrl:
                'https://example.com/dress.png', // Add imageUrl for product
          ),
          Product(
            name: "Skirt",
            price: 39.99,
            imageUrl:
                'https://example.com/skirt.png', // Add imageUrl for product
          ),
        ],
      ),
      Category(
        name: "Beauty",
        imageUrl:
            'https://cdn.icon-icons.com/icons2/1851/PNG/512/makeup_116527.png',
        products: [], // No products in beauty category yet
      ),
    ];
  }
}
