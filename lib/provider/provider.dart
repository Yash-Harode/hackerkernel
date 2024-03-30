import 'package:flutter/foundation.dart';
import '../provider/product.dart';

class ProviderName with ChangeNotifier {
  final List<Product> products = [
    Product("HeadPhone 1", 199, ""),
    Product("HeadPhone 2", 250, ""),
    Product("HeadPhone 3", 300, ""),
    Product("HeadPhone 4", 198, ""),
    Product("HeadPhone 5", 105, ""),
  ];

  final List<Accessories> accessories = [
    Accessories("EarPhone 1", 100, "image", true),
    Accessories("EarPhone 2", 200, "image", false),
    Accessories("EarPhone 3", 300, "image", false),
    Accessories("EarPhone 4", 1110, "image", true),
    Accessories("EarPhone 5", 190, "image", true),
  ];

  // Function to add a new product
  void addProduct(Product newProduct) {
    products.add(newProduct);
    notifyListeners();
  }

  // Function to delete a product
  void deleteProduct(int index) {
    products.removeAt(index);
    notifyListeners();
  }

  // Function to add a new accessory
  void addAccessory(Accessories newAccessory) {
    accessories.add(newAccessory);
    notifyListeners();
  }

  // Function to delete an accessory
  void deleteAccessory(int index) {
    accessories.removeAt(index);
    notifyListeners();
  }
}
