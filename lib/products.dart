import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products([this.products = const []]){
    print('[Products Widget] Constructor');
  }

  @override
  Widget build(BuildContext context) {
    // Column es un diseño vertical y lineal.
    print('[Products Widget] build()');
    return Column(
        children: products
            .map((element) => Card(
                  child: Column(
                    children: <Widget>[
                      //Image.asset('assets/food.jpg'),
                      Text(element)
                    ],
                  ),
                ))
            .toList()
    );
  }
}
