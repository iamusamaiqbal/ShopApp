import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier{
  List<Product> _list=[
    Product(
        id: '1231',
        desc: 'iron pan1',
        title: 'Pan1',
        price: 44,
        imageUrl:
        'https://i.pinimg.com/originals/bf/c9/24/bfc9242285c872a8d4ffb70c04834425.jpg'),
    Product(
        id: '1232',
        desc: 'iron pan2',
        title: 'Pan2',
        price: 344,
        imageUrl:
        'http://cdn.shopify.com/s/files/1/0013/3156/0548/products/Resize5_grande.jpg'),
    Product(
        id: '1233',
        desc: 'iron pan3',
        title: 'Pan3',
        price: 444,
        imageUrl:
        'https://www.shahzebsaeed.com/wp-content/uploads/2021/08/RTW-2276_1-500x667.jpg'),
    Product(
        id: '1234',
        desc: 'iron pan4',
        title: 'Pan4',
        price: 544,
        imageUrl:
        'https://cdn.shopclues.com/images1/thumbnails/97181/640/1/143857162-97181151-1551202706.jpg')
  ];

  List<Product> get itemList{
    return [..._list];
  }

  Product findById(String id){
    return _list.firstWhere((product)=> product.id == id);
  }

  void addProduct(){
    notifyListeners();
  }
}