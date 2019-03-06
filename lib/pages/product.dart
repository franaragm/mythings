import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Details!'),
            RaisedButton(
              child: Text('BACK'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      )
    );
  }
}
