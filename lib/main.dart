import 'package:flutter/material.dart';
import 'package:mythings/pages/products_admin.dart';
import 'package:mythings/pages/products_page.dart';
import 'package:mythings/pages/product.dart';

void main() {
  runApp(MyApp());
}

// StatefulWidgets son widgets especiales que saben cómo generar objetos State
// Esta clase es la configuración para el estado. Guarda
// los valores proporcionados por el padre y usados por el método
// build del State. Los campos en una subclase Widget siempre se marcan como "final".
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List <Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    // Cuando un usuario pulsa el boton se añade un producto, necesitamos cambiar _products
    // dentro de una llamada setState para activar un rebuild. El framework entonces llama a
    // build (que renderiza el listado de productos) que actualiza la apariencia visual de la aplicación.
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.blue
      ),
      // Scaffold es un layout para la mayoría de los Material Components.
      // home: AuthPage(),
      routes: {
        '/': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) => ProductsAdminPage(_addProduct, _deleteProduct)
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index]['title'], _products[index]['image']),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductsPage(_products)
        );
      },
    );
  }
}
