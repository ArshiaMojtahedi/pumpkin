import 'dart:typed_data';

import 'package:appwrite/models.dart';
import 'package:pumpkin/Data/model/product.dart';

class CategoryModel {
  String id;
  String name;
  String imageId;
  Uint8List image;
  String color;
  List<dynamic> products;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.imageId,
      required this.image,
      required this.color,
      required this.products});

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['\$id'] ?? '',
      name: map['name'] ?? '',
      imageId: map['image'] ?? '',
      image: Uint8List(0),
      color: map['color'] ?? '',
      products: map['products'] ?? '',
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['\$id'],
        name: json['name'],
        imageId: json['image'] ?? '',
        image: Uint8List(0),
        color: json['color'] ?? '',
        products: json['products'] ?? '',
      );
}
