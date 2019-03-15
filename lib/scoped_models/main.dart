import 'package:scoped_model/scoped_model.dart';

import 'package:mythings/scoped_models/products.dart';
import 'package:mythings/scoped_models/users.dart';
import 'package:mythings/scoped_models/connected_products.dart';

class MainModel extends Model with ConnectedProducts, UsersModel, ProductsModel {

}