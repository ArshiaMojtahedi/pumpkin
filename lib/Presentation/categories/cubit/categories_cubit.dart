import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pumpkin/App/dartz_x.dart';
import 'package:pumpkin/Data/model/product.dart';
import 'package:pumpkin/Data/network/failure.dart';
import 'package:pumpkin/Domain/usecase/categories_usecase.dart';
import 'package:pumpkin/Domain/usecase/single_category_usecase.dart';

import '../../../App/app_preferences.dart';
import '../../../Data/model/category.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesUseCase categoriesUseCase;
  SingleCategoryUseCase singleCategoryUseCase;

  CategoriesCubit(
      {required this.categoriesUseCase, required this.singleCategoryUseCase})
      : super(CategoriesEmpty());

  fetch() {
    emit(CategoriesProgress());

    categoriesUseCase.execute(CategoryUseCaseInput()).then((value) async {
      if (value.isRight()) {
        emit(CategoriesSuccesed(value.asRight()));
      } else if ((value.isLeft())) {
        emit(CategoriesFailed((value.asLeft())));
      }
    });
  }

  fetchCategoryProducts(String catId) {
    emit(SingleCategoryProgress());

    singleCategoryUseCase
        .execute(SingleCategoryProducsUseCaseInput(catId))
        .then((value) async {
      if (value.isRight()) {
        emit(SingleCategorySuccesed(value.asRight()));
      } else if ((value.isLeft())) {
        emit(SingleCategoryFailed((value.asLeft())));
      }
    });
  }
}
