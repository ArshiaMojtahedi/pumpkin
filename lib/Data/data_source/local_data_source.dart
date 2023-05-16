import 'dart:math';

import 'package:hive/hive.dart';
import 'package:pumpkin/Data/model/cartItem.dart';

abstract class LocalDataSource {
  Future<List<CartItem>> getCartItems();
  Future<void> addCartItem(CartItem item, {int count = 1});
  // Future<void> updateUser(UserModel user);
  // Future<void> deleteUser(int id);
}

class LocalDataSourceImpl implements LocalDataSource {
  static const _cartBox = 'cart';

  @override
  Future<List<CartItem>> getCartItems() async {
    final box = await Hive.openBox(_cartBox);
    final cartItems = box.values.map((e) => e as CartItem).toList();
    await box.close();
    return cartItems;
  }

  // @override
  // Future<void> addCartItem(CartItem item) async {
  //   final box = await Hive.openBox(_cartBox);
  //   await box.add(item);
  //   await box.close();
  // }

  @override
  Future<void> addCartItem(CartItem item, {int count = 1}) async {
    final box = await Hive.openBox(_cartBox);
    final existingIndex =
        box.values.toList().indexWhere((i) => i.id == item.id);

    if (existingIndex != -1) {
      final existingItem = box.getAt(existingIndex) as CartItem;
      final updatedItem = CartItem(
        id: existingItem.id,
        name: existingItem.name,
        price: existingItem.price,
        description: existingItem.description,
        image: existingItem.image,
        amount: existingItem.amount + count, // Increment the amount by 1
      );
      await box.putAt(existingIndex, updatedItem);
      // await box.clear();
    } else {
      await box.add(item);
    }

    await box.close();
  }

  // @override
  // Future<void> updateUser(UserModel user) async {
  //   final box = await Hive.openBox(_boxName);
  //   await box.put(user.id, user);
  //   await box.close();
  // }

  // @override
  // Future<void> deleteUser(int id) async {
  //   final box = await Hive.openBox(_boxName);
  //   await box.delete(id);
  //   await box.close();
  // }
}
