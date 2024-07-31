import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/product.dart';

class CardController extends ChangeNotifier {
  List<Product> productsinCard = [
    Product(
      category: "living room",
      count: 1,
      id: UniqueKey().toString(),
      imageUrl: "https://www.pngall.com/wp-content/uploads/2016/04/BMW-PNG-Image.png",
      price: 1555.0,
      title: "BMW",
      isLiked: false,
    ),
  ];

  void addtoCard(Product product) {
    int index = productsinCard.indexWhere((value) => value.id == product.id);
    if (index >= 0) {
      productsinCard[index].count++;
    } else {
      productsinCard.add(product);
    }
    notifyListeners();
  }

  void deletetoCard(Product product) {
    int index = productsinCard.indexWhere((value) => value.id == product.id);
    if (index >= 0) {
      if (product.count > 0) {
        productsinCard[index].count--;
      }
      if (product.count == 0) {
        productsinCard.removeAt(index);
      }
    }
    notifyListeners();
  }

  double totalPrice() {
    double total = 0;
    for (var product in productsinCard) {
      total += product.count * product.price;
    }
    notifyListeners();

    return total;
  }
}
