import 'package:flutter/material.dart';
import 'package:mythings/widgets/products/products.dart';

class ProductsPage extends StatelessWidget {
  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        AppBar(
          automaticallyImplyLeading: false,
          title: Text('Choose'),
        ),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Manage Products'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/admin');
          },
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('ListThings'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            )
          ],
        ),
        body: Products());
  }
}
