import 'package:flutter/material.dart';
import 'package:mythings/pages/products_page.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('LOGIN'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ));
  }
}
