import 'package:lichi_test/domain/entity/cart_items.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServices {
  static final DatabaseServices instance = DatabaseServices._init();

  static Database? _database;

  DatabaseServices._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('cart.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableCartItems ( 
  ${CartItemsFields.id} $idType, 
  ${CartItemsFields.name} $textType,
  ${CartItemsFields.image} $textType,
  ${CartItemsFields.price} $integerType,
  ${CartItemsFields.color} $textType,
  ${CartItemsFields.size} $textType, 
  ${CartItemsFields.quantity} $integerType
  )
''');
  }

  Future<CartItems?> createCartItem(CartItems cartItem) async {
    final db = await instance.database;

    try {
      final cartItemExist = await readCartItem(cartItem.id);
      if (cartItemExist != null) {
        final updatedCartItem = cartItemExist.copyWith(
          quantity: cartItemExist.quantity + 1,
        );
        await update(updatedCartItem);
      } else {
        final id = await db.insert(tableCartItems, cartItem.toJson());
        return cartItem.copyWith(id: id);
      }
    } catch (e) {
      print('Что-то навернулось: $e');
      return cartItem;
    }
    return null;
  }

  Future<List<CartItems>> readAllCartItems() async {
    final db = await instance.database;

    final result = await db.query(tableCartItems);
    return result.map((json) => CartItems.fromJson(json)).toList();
  }

  Future<CartItems?> readCartItem(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableCartItems,
      columns: CartItemsFields.values,
      where: '${CartItemsFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return CartItems.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<int> update(CartItems cartItem) async {
    final db = await instance.database;

    return db.update(
      tableCartItems,
      cartItem.toJson(),
      where: '${CartItemsFields.id} = ?',
      whereArgs: [cartItem.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    final cartItem = await readCartItem(id);

    if (cartItem == null) return 0;

    if (cartItem.quantity > 1) {
      return await db.update(
        tableCartItems,
        {'quantity': cartItem.quantity - 1},
        where: 'id = ?',
        whereArgs: [id],
      );
    } else {
      return await db.delete(
        tableCartItems,
        where: '${CartItemsFields.id} = ?',
        whereArgs: [id],
      );
    }
  }

  Future<int> addOne(int id) async {
    final db = await instance.database;
    final cartItem = await readCartItem(id);

    if (cartItem == null) return 0;

    return await db.update(
      tableCartItems,
      {'quantity': cartItem.quantity + 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
