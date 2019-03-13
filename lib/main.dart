import 'package:flutter/material.dart';
import 'package:mythings/pages/products_admin.dart';
import 'package:mythings/pages/products_page.dart';
import 'package:mythings/pages/product.dart';
import 'package:mythings/pages/auth.dart';
import 'package:mythings/models/product.dart';

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
  List<Product> _products = [];

  void _addProduct(Product product) {
    // Cuando un usuario pulsa el boton se añade un producto, necesitamos cambiar _products
    // dentro de una llamada setState para activar un rebuild. El framework entonces llama a
    // build (que renderiza el listado de productos) que actualiza la apariencia visual de la aplicación.
    setState(() {
      _products.add(product);
    });
  }

  void _updateProduct(int index, Product product) {
    setState(() {
      _products[index] = product;
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
          accentColor: Colors.blue),
      // Scaffold es un layout para la mayoría de los Material Components.
      // home: AuthPage(),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) =>
            ProductsAdminPage(_addProduct, _updateProduct, _deleteProduct, _products)
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
                _products[index].title,
                _products[index].image,
                _products[index].price,
                _products[index].description),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(_products));
      },
    );
  }
}
