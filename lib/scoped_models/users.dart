
import 'package:mythings/models/user.dart';
import 'package:mythings/scoped_models/connected_products.dart';

mixin UsersModel on ConnectedProducts {
  void login(String email, String password) {
    authenticatedUser = User(id: 'iuucho', email: email, password: password);
  }
}