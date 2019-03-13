import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import 'package:mythings/pages/products_admin.dart';
import 'package:mythings/pages/products_page.dart';
import 'package:mythings/pages/product.dart';
import 'package:mythings/pages/auth.dart';
import 'package:mythings/scoped_models/products.dart';

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
  @override
  Widget build(BuildContext context) {
    return ScopedModel<ProductsModel>(
      model: ProductsModel(),
      child: MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.lightBlue,
            accentColor: Colors.blue),
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/products': (BuildContext context) => ProductsPage(),
          '/admin': (BuildContext context) => ProductsAdminPage()
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
                builder: (BuildContext context) =>
                    ProductPage(null, null, null, null));
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => ProductsPage());
        },
      ),
    );
  }
}
