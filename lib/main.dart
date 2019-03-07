import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:mythings/pages/auth.dart';
import 'package:mythings/pages/products_admin.dart';
import 'package:mythings/pages/products_page.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.deepPurple
      ),
      // Scaffold es un layout para la mayoría de los Material Components.
      // home: AuthPage(),
      routes: {
        '/': (BuildContext context) => ProductsPage(),
        '/admin': (BuildContext context) => ProductsAdminPage()
      },
    );
  }
}
