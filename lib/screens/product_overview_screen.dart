import 'package:flutter/material.dart';
import 'package:untitled/widgets/product_items.dart';
import 'package:provider/provider.dart';

import '../widgets/gridview.dart';
import '../widgets/badge.dart';
import '../providers/cart_model.dart';
import '../screens/cart_screen.dart';
import '../widgets/app_drawer.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 0) {

              } else {}
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 0, child: Text('Cart')),
              const PopupMenuItem(value: 1, child: Text('Fav')),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, c) => Badge(
              child: c,
              value: cart.itemCount.toString(),
              color: Colors.red,
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: GridViewWidget(),
    );
  }
}
