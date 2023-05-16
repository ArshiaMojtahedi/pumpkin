import 'dart:typed_data';

import 'package:hive/hive.dart';
part 'cartItem.g.dart';

@HiveType(typeId: 0)
class CartItem extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  double? price;
  @HiveField(4)
  final int amount;
  @HiveField(5)
  final Uint8List? image;

  CartItem(
      {required this.id,
      this.name,
      this.description,
      this.price,
      required this.amount,
      this.image});
}
