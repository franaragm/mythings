import 'package:flutter/material.dart';

import 'package:mythings/widgets/products/product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products) {
    print('[Products Widget] Constructor');
  }

  Widget _buildProductList() {
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
    // Column es un diseño vertical y lineal.
    print('[Products Widget] build()');
    return _buildProductList();
  }
}
