import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products([this.products = const []]) {
    print('[Products Widget] Constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Text(products[index])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Column es un diseño vertical y lineal.
    print('[Products Widget] build()');

    return products.length > 0
        ? ListView.builder(
            itemBuilder: (context, index) => _buildProductItem(context, index),
            itemCount: products.length,
          )
        : Center(
            child: Text('No products found, please add some'),
          );
  }
}
