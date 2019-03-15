import 'package:scoped_model/scoped_model.dart';

import 'package:mythings/models/product.dart';
import 'package:mythings/models/user.dart';

mixin ConnectedProducts on Model {
  List<Product> products = [];
  int selProductIndex;
  User authenticatedUser;

  void addProduct(String title, String description, String image, double price) {
    final Product newProduct = Product(title: title, description: description, price: price, image: image, userEmail: authenticatedUser.email, userId: authenticatedUser.id);
    products.add(newProduct);
    selProductIndex = null;
    notifyListeners();
  }

}