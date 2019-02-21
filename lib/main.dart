import 'package:flutter/material.dart';

import 'package:mythings/product_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Scaffold es un layout para la mayoría de los Material Components.
      home: Scaffold(
          appBar: AppBar(
            title: Text('EasyList'),
          ),
          body: ProductManager('Food Tester')
      ),
    );
  }
}
