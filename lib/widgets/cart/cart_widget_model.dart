import 'package:flutter/material.dart';
import 'package:lichi_test/domain/entity/cart_items.dart';
import 'package:lichi_test/domain/services/database_services.dart';

class CartWidgetModel extends ChangeNotifier {
  final DatabaseServices _databaseServices = DatabaseServices.instance;
  List<CartItems> _cartItems = [];
  List<CartItems> get cartItems => _cartItems;
  CartWidgetModel() {
    getCartItems();
  }

  int _totalPrice = 0;
  String get totalPrice => _totalPrice.toString();

  bool _cartIsEmpty = true;
  bool get cartIsEmpty => _cartIsEmpty;

  void _calculateTotalPrice() {
    _totalPrice = 0;
    for (final cartItem in _cartItems) {
      _totalPrice += cartItem.quantity * cartItem.price;
    }
  }

  Future<void> getCartItems() async {
    _cartItems = await _databaseServices.readAllCartItems();

    print(_cartItems);
    _cartIsEmpty = _cartItems.isEmpty;
    _calculateTotalPrice();
    notifyListeners();
  }

  Future<void> deleteCartItem(int id) async {
    await _databaseServices.delete(id);
    getCartItems();
  }

  Future<void> plusOneToCartItem(int id) async {
    await _databaseServices.addOne(id);
    getCartItems();
  }
}
