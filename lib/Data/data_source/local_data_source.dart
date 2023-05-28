import 'dart:math';

import 'package:hive/hive.dart';
import 'package:pumpkin/Data/model/cartItem.dart';

abstract class LocalDataSource {
  Future<List<CartItem>> getCartItems();
  Future<void> addCartItem(CartItem item, {int count = 1});
  Future<void> updateCartItem(String id, int count);
  Future<void> deleteCartItem(String id);
  Future<int> getCartCount();
  Future<int> getItemCount(String id);

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
        amount: existingItem.amount + count, // Increment the amount by count
      );
      await box.putAt(existingIndex, updatedItem);
      // await box.clear();
    } else {
      await box.add(item);
    }

    await box.close();
  }

  @override
  Future<void> updateCartItem(String id, int count) async {
    final box = await Hive.openBox(_cartBox);
    final existingIndex = box.values.toList().indexWhere((i) => i.id == id);
    final existingItem = box.getAt(existingIndex) as CartItem;
    final updatedItem = CartItem(
      id: existingItem.id,
      name: existingItem.name,
      price: existingItem.price,
      description: existingItem.description,
      image: existingItem.image,
      amount: count,
    );
    await box.putAt(existingIndex, updatedItem);

    await box.close();
  }

  @override
  Future<void> deleteCartItem(String id) async {
    final box = await Hive.openBox<CartItem>(_cartBox);
    final itemIndex = box.values
        .cast<CartItem>()
        .toList()
        .indexWhere((item) => item.id == id);
    if (itemIndex != -1) {
      await box.deleteAt(itemIndex);
    }
    await box.close();
  }

  @override
  Future<int> getCartCount() async {
    final box = await Hive.openBox<CartItem>(_cartBox);
    final count = box.length;
    await box.close();
    return count;
  }

  @override
  Future<int> getItemCount(String id) async {
    final box = await Hive.openBox<CartItem>(_cartBox);
    final count = box.values
        .cast<CartItem>()
        .where((item) => item.id == id)
        .fold(0, (sum, item) => sum + item.amount);
    await box.close();
    return count;
  }
}
