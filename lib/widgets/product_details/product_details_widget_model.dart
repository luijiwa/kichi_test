import 'package:flutter/material.dart';
import 'package:lichi_test/domain/entity/cart_items.dart';
import 'package:lichi_test/domain/entity/list_product.dart';
import 'package:lichi_test/domain/services/api_services.dart';
import 'package:lichi_test/domain/services/database_services.dart';

class ProductDetailsWidgetModel extends ChangeNotifier {
  String url = 'https://api.lichi.com/product/get_product_detail';

  final DatabaseServices _databaseServices = DatabaseServices.instance;
  int _cartCount = 0;
  int get cartCount => _cartCount;

  AProduct? _product;
  AProduct? get product => _product;

  Future<void> loadOneProduct(int id) async {
    Object data = {
      'shop': 2,
      'lang': 1,
      'id': id,
    };
    final productDetails = await ApiService().fetchOneProduct(url, data);
    _product = productDetails;
    notifyListeners();
  }

  Future<void> addItemToCart(AProduct product, Color color) async {
    print(product.name);
    String actualColor = color.toString();
    final CartItems cartItem = CartItems(
      id: product.id,
      name: product.name,
      image: product.photos[0].big,
      color: actualColor,
      price: product.price,
      size: product.sizes.size3.name,
      quantity: 1,
    );
    await _databaseServices.createCartItem(cartItem);
    notifyListeners();
  }

  Future<void> getCartItemsCount() async {
    List cartItems = await _databaseServices.readAllCartItems();
    _cartCount = cartItems.length;

    notifyListeners();
  }
}
