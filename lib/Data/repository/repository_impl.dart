import 'dart:convert';
import 'dart:typed_data';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:pumpkin/Data/model/category.dart';
import 'package:pumpkin/Data/model/product.dart';

import '../../Domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/failure.dart';
import '../network/network_info.dart';
import '../request/request.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo? _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Session>> login(LoginRequest loginRequest) async {
    if (kIsWeb ? true : (await _networkInfo?.isConnected ?? false)) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        return Right(response);
      } on AppwriteException catch (e) {
        return Left(Failure(e.code ?? 0,
            e.message ?? 'Some thing went wrong, try again later'));
      } catch (error) {
        return Left(Failure(0, error.toString()));
      }
    } else {
      return Left(Failure(-7, 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, User>> register(LoginRequest loginRequest) async {
    if (kIsWeb ? true : (await _networkInfo?.isConnected ?? false)) {
      try {
        final response = await _remoteDataSource.register(loginRequest);
        return Right(response);
      } on AppwriteException catch (e) {
        return Left(Failure(e.code ?? 0,
            e.message ?? 'Some thing went wrong, try again later'));
      } catch (error) {
        return Left(Failure(0, error.toString()));
      }
    } else {
      return Left(Failure(-7, 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, Session>> anonymousSession() async {
    if (kIsWeb ? true : (await _networkInfo?.isConnected ?? false)) {
      try {
        final response = await _remoteDataSource.anonymousSession();
        return Right(response);
      } on AppwriteException catch (e) {
        return Left(Failure(e.code ?? 0,
            e.message ?? 'Some thing went wrong, try again later'));
      } catch (error) {
        return Left(Failure(0, error.toString()));
      }
    } else {
      return Left(Failure(-7, 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, Token>> forgotPassword(String email) async {
    if (kIsWeb ? true : (await _networkInfo?.isConnected ?? false)) {
      try {
        final response = await _remoteDataSource.forgotPassword(email);
        return Right(response);
      } on AppwriteException catch (e) {
        return Left(Failure(e.code ?? 0,
            e.message ?? 'Some thing went wrong, try again later'));
      } catch (error) {
        return Left(Failure(0, error.toString()));
      }
    } else {
      return Left(Failure(-7, 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteSession(String sessionId) async {
    if (kIsWeb ? true : (await _networkInfo?.isConnected ?? false)) {
      try {
        final res = await _remoteDataSource.deleteSession(sessionId);
        return Right(res);
      } on AppwriteException catch (e) {
        return Left(Failure(e.code ?? 0,
            e.message ?? 'Some thing went wrong, try again later'));
      } catch (error) {
        return Left(Failure(0, error.toString()));
      }
    } else {
      return Left(Failure(-7, 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, File>> createFile(
      Uint8List uint8list, String name) async {
    if (kIsWeb ? true : (await _networkInfo?.isConnected ?? false)) {
      try {
        final res = await _remoteDataSource.createFile(uint8list, name);
        return Right(res);
      } on AppwriteException catch (e) {
        return Left(Failure(e.code ?? 0,
            e.message ?? 'Some thing went wrong, try again later'));
      } catch (error) {
        return Left(Failure(0, error.toString()));
      }
    } else {
      return Left(Failure(-7, 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteFile(String idFile) async {
    if (kIsWeb ? true : (await _networkInfo?.isConnected ?? false)) {
      try {
        final res = await _remoteDataSource.deleteFile(idFile);
        return Right(res);
      } on AppwriteException catch (e) {
        return Left(Failure(e.code ?? 0,
            e.message ?? 'Some thing went wrong, try again later'));
      } catch (error) {
        return Left(Failure(0, error.toString()));
      }
    } else {
      return Left(Failure(-7, 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (kIsWeb ? true : (await _networkInfo?.isConnected ?? false)) {
      try {
        final res = await _remoteDataSource.getAllProducts();
        var data = res.documents
            .map((product) => Product.fromMap(product.data))
            .toList();

        for (var product in data) {
          {
            Uint8List image =
                await _remoteDataSource.getFilePreview(product.imageId);

            product.image = image;
          }
        }

        return Right(data);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(Failure(e.code ?? 0,
            e.message ?? 'Some thing went wrong, try again later'));
      } catch (error) {
        return Left(Failure(0, error.toString()));
      }
    } else {
      return Left(Failure(-7, 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, Product>> getSingleProduct(String productId) async {
    if (kIsWeb ? true : (await _networkInfo?.isConnected ?? false)) {
      try {
        final res = await _remoteDataSource.getSingleProduct(productId);

        Product product = Product.fromJson(res.data);

        Uint8List image =
            await _remoteDataSource.getFilePreview(product.imageId);

        product.image = image;

        return Right(product);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(Failure(e.code ?? 0,
            e.message ?? 'Some thing went wrong, try again later'));
      } catch (error) {
        return Left(Failure(0, error.toString()));
      }
    } else {
      return Left(Failure(-7, 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    if (kIsWeb ? true : (await _networkInfo?.isConnected ?? false)) {
      try {
        final res = await _remoteDataSource.getAllCategories();
        var data = res.documents
            .map((category) => CategoryModel.fromMap(category.data))
            .toList();

        for (var category in data) {
          {
            Uint8List image =
                await _remoteDataSource.getFilePreview(category.imageId);

            category.image = image;
          }
        }

        return Right(data);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(Failure(e.code ?? 0,
            e.message ?? 'Some thing went wrong, try again later'));
      } catch (error) {
        return Left(Failure(0, error.toString()));
      }
    } else {
      return Left(Failure(-7, 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getSingleCategory(String catId) async {
    if (kIsWeb ? true : (await _networkInfo?.isConnected ?? false)) {
      try {
        final res = await _remoteDataSource.getSingleCategory(catId);

        List<Product> products = [];

        for (dynamic productData in res.data['products']) {
          Map<String, dynamic> data = Map<String, dynamic>.from(productData);
          Product product = Product.fromJson(data);
          products.add(product);
        }

        for (var product in products) {
          {
            Uint8List image =
                await _remoteDataSource.getFilePreview(product.imageId);

            product.image = image;
          }
        }

        return Right(products);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(Failure(e.code ?? 0,
            e.message ?? 'Some thing went wrong, try again later'));
      } catch (error) {
        return Left(Failure(0, error.toString()));
      }
    } else {
      return Left(Failure(-7, 'Please check your internet connection'));
    }
  }
}
