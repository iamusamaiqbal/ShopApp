import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/product_provider.dart';
import '../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {

  static String routeName = '/produt-details';

  @override
  Widget build(BuildContext context) {
    final String productId = ModalRoute.of(context).settings.arguments;
    final Product product = Provider.of<ProductProvider>(context,listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
