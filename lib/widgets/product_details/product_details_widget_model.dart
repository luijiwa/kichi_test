import 'package:flutter/material.dart';
import 'package:lichi_test/domain/entity/cart_items.dart';
import 'package:lichi_test/domain/entity/list_product.dart';
import 'package:lichi_test/domain/services/database_services.dart';

class ProductDetailsWidgetModel extends ChangeNotifier {
  final DatabaseServices _databaseServices = DatabaseServices();

  void addCartItem(AProduct product) {
    final CartItems cartItem = CartItems(
      aproduct: product,
      quantity: 1,
    );
    _databaseServices.addCartItem(cartItem);
    notifyListeners();
  }
}
