import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:pumpkin/Data/model/category.dart';

import '../../Data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class CategoriesUseCase
    implements BaseUseCase<CategoryUseCaseInput, List<CategoryModel>> {
  final Repository _repository;

  CategoriesUseCase(this._repository);

  @override
  Future<Either<Failure, List<CategoryModel>>> execute(
          CategoryUseCaseInput input) =>
      _repository.getAllCategories();
}

class CategoryUseCaseInput {
  CategoryUseCaseInput();
}
