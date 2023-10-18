import 'package:flutter/material.dart';
import 'package:lichi_test/domain/entity/cart_items.dart';
import 'package:lichi_test/domain/services/database_services.dart';

class CartWidgetModel extends ChangeNotifier {
  final DatabaseServices _databaseServices = DatabaseServices();

  List<CartItems> _cartItems = [];
  List<CartItems> get cartItems => _cartItems;

  int _totalPrice = 0;
  String get totalPrice => _totalPrice.toString();

  bool _cartEmpty = false;
  bool get cartEmpty => _cartEmpty;

  void _calculateTotalPrice() {
    _totalPrice = 0;
    for (final cartItem in _cartItems) {
      _totalPrice += cartItem.quantity * cartItem.aproduct.price;
    }
  }

  Future<void> getCartItems() async {
    _cartItems = await _databaseServices.getCartItems();
    _cartEmpty = _cartItems.isEmpty;
    _calculateTotalPrice();
    notifyListeners();
  }
}
