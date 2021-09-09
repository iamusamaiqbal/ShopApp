import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_details_screen.dart';
import '../providers/product_model.dart';
import '../providers/cart_model.dart';

class ProductItems extends StatelessWidget {
  // final String id;
  // final String imageUrl;
  // final String title;
  //
  // ProductItems({this.title, this.imageUrl, this.id});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductDetailScreen.routeName,
              arguments: product.id);
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            leading: Consumer<Product>(
              builder: (context, child, s) => IconButton(
                icon: (product.isFav == false)
                    ? Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                onPressed: () {
                  product.toggleFav();
                },
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart_outlined),
              onPressed: () {
                cart.addToCart(
                    productId: product.id,
                    price: product.price,
                    title: product.title);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('DONE'),
                  duration: Duration(seconds: 3),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeSingleItemCart(productId: product.id);
                    },
                  ),
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
