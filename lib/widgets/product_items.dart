import 'package:flutter/material.dart';
import 'package:untitled/screens/product_details_screen.dart';

class ProductItems extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;

  ProductItems({this.title, this.imageUrl, this.id});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, ProductDetailScreen.routeName,arguments: this.id);
        },
        child: GridTile(

          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: (){},
            ),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart_outlined),
              onPressed: (){},
            ),
          ),
        ),
      ),
    );
  }
}
