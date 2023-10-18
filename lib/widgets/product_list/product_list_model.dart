import 'package:flutter/material.dart';
import 'package:lichi_test/domain/api_services.dart';
import 'package:lichi_test/entity/list_product.dart';

class ProductListWidgetModel extends ChangeNotifier {
  List<AProduct> _productList = [];

  List<AProduct> get productList => _productList;

  Future<void> loadProduct() async {
    final news = await ApiService().fetchProducts();
    _productList = news;
    notifyListeners();
  }
}