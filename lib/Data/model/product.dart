import 'dart:typed_data';

import 'package:appwrite/models.dart';

class Product {
  String id;
  String name;
  String description;
  String detail;
  double price;
  String imageId;
  Uint8List image;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.detail,
      required this.price,
      required this.imageId,
      required this.image});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['\$id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      detail: map['detail'] ?? 'adsd',
      price: map['price'] ?? '',
      imageId: map['image'] ?? '',
      image: Uint8List(0),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['\$id'],
        name: json['name'],
        description: json['description'],
        detail: json['detail'] ?? '',
        price: json['price'],
        imageId: json['image'] ?? '',
        image: Uint8List(0),
      );

  // Map<String, dynamic> toJson() => {
  //       'name': name,
  //       'price': price,
  //     };
}
