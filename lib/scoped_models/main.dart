import 'package:scoped_model/scoped_model.dart';

import 'package:mythings/scoped_models/connected_products.dart';

class MainModel extends Model with ConnectedProductsModel, UsersModel, ProductsModel {}