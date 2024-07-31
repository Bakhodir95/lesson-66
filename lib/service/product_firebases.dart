import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/service/image_firestorege_service.dart';

class ProductFirebases extends ChangeNotifier {
  final CollectionReference _productCollection =
      FirebaseFirestore.instance.collection("products");

  final IMageFirestoregeService imageFireStorage = IMageFirestoregeService();

  Stream<QuerySnapshot> get productsStream => _productCollection.snapshots();

  Future<void> addProduct(Product product, File file) async {
    String url = await imageFireStorage.addImage(product.title, file);
    await _productCollection.add({
      'name': product.title,
      'imageUrl': url,
      'category': product.category,
      'count': product.count,
      'price': product.price,
    });
  }

  void editProduct(Product product) {
    _productCollection.doc(product.id).update({
      'name': product.title,
      'imageUrl': product.imageUrl,
      'category': product.category,
      'count': product.count,
      'price': product.price,
    });
  }

  void deleteProduct(String id) {
    _productCollection.doc(id).delete();
  }
}
