import 'dart:async';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  _showWarningDialog(BuildContext context) {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('Are you sure?'),
        content: Text('This action cannot be undone!'),
        actions: <Widget>[
          FlatButton(child: Text('DISCARD'), onPressed: () {
            Navigator.pop(context); // close overlay
          },),
          FlatButton(child: Text('CONTINUE'), onPressed: () {
            Navigator.pop(context); // close overlay
            Navigator.pop(context, true); // close this page in stack
          },),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        onWillPop: () {
          print('Back button pressed');
          Navigator.pop(context, false); // custom back button
          return Future.value(false);
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(imageUrl),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(title),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      child: Text('Delete'),
                      onPressed: () => _showWarningDialog(context),
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}
