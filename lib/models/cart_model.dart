import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _items = [
    ["Banana", "1.99", "assets/images/banana.png", Colors.yellow],
    ["Carrot", "0.99", "assets/images/carrot.png", Colors.orange],
    ["Chicken", "2.99", "assets/images/chiken.png", Colors.brown],
    ["Chilli", "1.49", "assets/images/chilli.png", Colors.red],
  ];

  List _cartItems = [];

  get items => _items;

  //adď item to cart
  void addItemToCart(int item) {
    _cartItems.add(_items[item]);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(int item) {
    _cartItems.removeAt(item);
    notifyListeners();
  }

  //calculate total price
  get cartItems => _cartItems;

  String getTotalPrice() {
    double total = 0.0;
    for (var item in _cartItems) {
      total += double.parse(item[1]);
    }
    return total.toStringAsFixed(2);
  }
}
