import 'package:flutter/material.dart';

import 'package:mythings/products.dart';
import 'package:mythings/product_control.dart';

// StatefulWidgets son widgets especiales que saben cómo generar objetos State
// Esta clase es la configuración para el estado. Guarda
// los valores proporcionados por el padre y usados por el método
// build del State. Los campos en una subclase Widget siempre se marcan como "final".
class ProductManager extends StatefulWidget {
  // Los campos en una subclase de Widgets siempre están marcados como "final".
  final String startingProduct;

  // constructor
  ProductManager({this.startingProduct}) {
    print('[product manager widget] constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[product manager widget] createState()');
    return _ProductManagerState();
  }

/*
  @override
  _ProductManagerState createState() => _ProductManagerState();
  */
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    print('[product manager state] initState()');
    super.initState();
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[product manager state] didUpdatewidget');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(String product) {
    // Cuando un usuario pulsa el boton se añade un producto, necesitamos cambiar _products
    // dentro de una llamada setState para activar un rebuild. El framework entonces llama a
    // build (que renderiza el listado de productos) que actualiza la apariencia visual de la aplicación.
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[product manager state] build()');
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(10.0),
            child: ProductControl(_addProduct)
        ),
        Expanded(
            child: Products(_products)
        )
      ],
    );
  }
}
