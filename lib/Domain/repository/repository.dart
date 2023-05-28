import 'dart:typed_data';

import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:pumpkin/Data/model/cartItem.dart';
import 'package:pumpkin/Data/model/category.dart';

import '../../Data/model/product.dart';
import '../../Data/network/failure.dart';
import '../../Data/request/request.dart';

abstract class Repository {
  Future<Either<Failure, Session>> login(LoginRequest loginRequest);

  Future<Either<Failure, User>> register(LoginRequest loginRequest);

  Future<Either<Failure, Session>> anonymousSession();

  Future<Either<Failure, Token>> forgotPassword(String email);

  Future<Either<Failure, dynamic>> deleteSession(String sessionId);

  Future<Either<Failure, File>> createFile(Uint8List uint8list, String name);

  Future<Either<Failure, dynamic>> deleteFile(String idFile);

  Future<Either<Failure, List<Product>>> getAllProducts();

  Future<Either<Failure, Product>> getSingleProduct(String productId);

  Future<Either<Failure, List<CategoryModel>>> getAllCategories();

  Future<Either<Failure, List<Product>>> getSingleCategory(String catId);

  //Local

  Future<Either<Failure, List<CartItem>>> getCartItems();

  Future<Either<Failure, void>> addCartItem(CartItem cartItem, int count);

  Future<Either<Failure, void>> updateCartItem(String id, int count);

  Future<Either<Failure, void>> deleteCartItem(String id);

  Future<Either<Failure, int>> getCartCount();

  Future<Either<Failure, int>> getItemCount(String id);
}
