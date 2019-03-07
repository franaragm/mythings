import 'package:flutter/material.dart';

import 'package:mythings/pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;

  Products([this.products = const []]) {
    print('[Products Widget] Constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ProductPage(
                            products[index]['title'], products[index]['image']),
                      ),
                    ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCards;

    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (context, index) => _buildProductItem(context, index),
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
