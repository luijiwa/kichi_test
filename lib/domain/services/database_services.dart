import 'package:lichi_test/domain/entity/cart_items.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServices {
  Database? _db;

  Future<void> open() async {
    _db = await openDatabase('cart.db');
  }

  Future<void> close() async {
    await _db?.close();
  }

  Future<List<CartItems>> getCartItems() async {
    final List<Map<String, Object?>>? results = await _db?.query('cart_items');
    return results?.map((result) => CartItems.fromJson(result)).toList() ?? [];
  }

  Future<void> addCartItem(CartItems cartItem) async {
    await _db?.insert('cart_items', cartItem.toJson());
  }

  Future<void> updateCartItem(CartItems cartItem) async {
    await _db?.update('cart_items', cartItem.toJson(),
        where: 'id = ?', whereArgs: [cartItem.aproduct.id]);
  }

  Future<void> removeCartItem(int id) async {
    await _db?.delete('cart_items', where: 'id = ?', whereArgs: [id]);
  }
}
