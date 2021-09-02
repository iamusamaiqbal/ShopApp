import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String desc;
  final String imageUrl;
  final double price;
  bool isFav = false;

  Product({this.id,this.desc,this.imageUrl,this.price,this.title,this.isFav});

  void toggleFav(){
    (isFav==false)? isFav=true:isFav=false;
    notifyListeners();
  }
}