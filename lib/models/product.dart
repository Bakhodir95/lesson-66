import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String title;
  double price;
  int count;
  String imageUrl;
  String category;
  bool isLiked;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.count,
    required this.imageUrl,
    required this.category,
    required this.isLiked,
  });

  factory Product.fromQuery(QueryDocumentSnapshot query) {
    Map<String, dynamic> data = query.data() as Map<String, dynamic>;

    return Product(
      id: query.id,
      title: data['title'] ?? '',
      price: (data['price'] ?? 0.0).toDouble(),
      count: data['count'] ?? 0,
      imageUrl: data['imageUrl'] ?? '',
      category: data['category'] ?? '',
      isLiked: data['isLiked'] ?? false,
    );
  }
}
