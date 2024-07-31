import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';

class ProductController {
  
  final List<Product> _list = [
    Product(
      category: "living room",
      count: 100,
      id: UniqueKey().toString(),
      imageUrl: "https://www.pngall.com/wp-content/uploads/2016/04/BMW-PNG-Image.png",
      price: 1550.0,
      title: "BMW",
      isLiked: false,
    ),
    Product(
      category: "living room",
      count: 100,
      id: UniqueKey().toString(),
      imageUrl: "https://www.pngall.com/wp-content/uploads/2016/04/BMW-PNG-Image.png",
      price: 1555.0,
      title: "BMW",
      isLiked: false,
    ),
    Product(
      category: "living room",
      count: 100,
      id: UniqueKey().toString(),
      imageUrl: "https://www.pngall.com/wp-content/uploads/2016/04/BMW-PNG-Image.png",
      price: 155.0,
      title: "BMW",
      isLiked: false,
    ),
  ];

  List<Product> get list => [..._list];

  isLiked(String id) {
    _list.forEach((value) {
      if (value.id == id) {
        value.isLiked = !value.isLiked;
      }
    });
  }
}
