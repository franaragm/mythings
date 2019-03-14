import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:mythings/widgets/products/product_card.dart';
import 'package:mythings/scoped_models/products.dart';
import 'package:mythings/models/product.dart';

class Products extends StatelessWidget {
  Widget _buildProductList(List<Product> products) {
    Widget productCards;

    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (context, index) => ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productCards = Container();
    }

    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(builder: (BuildContext context, Widget child, ProductsModel model) {
      return _buildProductList(model.displayedProducts);
    },);
  }
}
