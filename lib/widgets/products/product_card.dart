import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import 'package:mythings/widgets/products/price_tag.dart';
import 'package:mythings/widgets/ui_elements/title_default.dart';
import 'package:mythings/widgets/products/address_tag.dart';
import 'package:mythings/models/product.dart';
import 'package:mythings/scoped_models/products.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(product.title),
          SizedBox(
            width: 8.0,
          ),
          PriceTag(product.price.toString())
        ],
      ),
    );
  }

  Widget _buildActionsButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.info),
            color: Colors.green,
            onPressed: () => Navigator.pushNamed<bool>(
                context, '/product/' + productIndex.toString())),
        ScopedModelDescendant<ProductsModel>(
          builder: (BuildContext context, Widget child, ProductsModel model) {
            return IconButton(
                icon: Icon(model.products[productIndex].isFavorite ? Icons.favorite : Icons.favorite_border),
                color: Colors.red,
                onPressed: () {
                  model.selectProduct(productIndex);
                  model.toggleProductFavoriteStatus();
                },);
          },),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          _buildTitlePriceRow(),
          AddressTag('Union Square, San Francisco'),
          _buildActionsButtons(context)
        ],
      ),
    );
    ;
  }
}
