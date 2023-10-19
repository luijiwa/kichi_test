import 'package:flutter/material.dart';

import 'package:lichi_test/domain/services/api_services.dart';

import '../../domain/entity/list_product.dart';
import '../../domain/services/database_services.dart';

class ProductListWidgetModel extends ChangeNotifier {
  final DatabaseServices _databaseServices = DatabaseServices.instance;
  int _cartCount = 0;
  int get cartCount => _cartCount;
  List<AProduct> _productList = [];

  List<AProduct> get productList => _productList;

  Future<void> loadProduct() async {
    final news = await ApiService().fetchProducts();
    _productList = news;
    notifyListeners();
  }

  Future<void> getCartItemsCount() async {
    List cartItems = await _databaseServices.readAllCartItems();
    _cartCount = cartItems.length;

    notifyListeners();
  }
}
