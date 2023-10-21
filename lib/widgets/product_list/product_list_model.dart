import 'package:flutter/material.dart';

import 'package:lichi_test/domain/services/api_services.dart';

import '../../domain/entity/list_product.dart';
import '../../domain/services/database_services.dart';

class ProductListWidgetModel extends ChangeNotifier {
  String url = 'https://api.lichi.com/category/get_category_product_list';
  Object data = {
    'shop': 2,
    'lang': 1,
    'category': 'dresses',
    'limit': 12,
    'pages': 1,
  };
  final DatabaseServices _databaseServices = DatabaseServices.instance;
  int _cartCount = 0;
  int get cartCount => _cartCount;

  List<AProduct> _productList = [];
  List<AProduct> get productList => _productList;

  Future<void> loadProducts() async {
    final itemList = await ApiService().fetchProducts(url, data);
    _productList = itemList;
    notifyListeners();
  }

  Future<void> getCartItemsCount() async {
    List cartItems = await _databaseServices.readAllCartItems();
    _cartCount = cartItems.length;

    notifyListeners();
  }
}
