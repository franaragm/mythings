import 'package:flutter/material.dart';

import 'package:mythings/products.dart';

// StatefulWidgets son widgets especiales que saben cómo generar objetos State
// Esta clase es la configuración para el estado. Guarda
// los valores proporcionados por el padre y usados por el método
// build del State. Los campos en una subclase Widget siempre se marcan como "final".
class ProductManager extends StatefulWidget {

  // Los campos en una subclase de Widgets siempre están marcados como "final".
  final String startingProduct;

  // constructor
  ProductManager(this.startingProduct);

  /*@override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }*/

  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    super.initState();
    _products.add(widget.startingProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              // Cuando un usuario pulsa el boton se añade un producto, necesitamos cambiar _products
              // dentro de una llamada setState para activar un rebuild. El framework entonces llama a
              // build (que renderiza el listado de productos) que actualiza la apariencia visual de la aplicación.
              setState(() {
                _products.add('Advanced Food Tester');
              });
            },
            child: Text('Add Product'),
          ),
        ),
        Products(_products)
      ],);
  }
}
