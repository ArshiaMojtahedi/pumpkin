import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pumpkin/App/dartz_x.dart';
import 'package:pumpkin/Data/model/product.dart';
import 'package:pumpkin/Data/network/failure.dart';
import 'package:pumpkin/Domain/usecase/login_usecase.dart';
import 'package:pumpkin/Domain/usecase/products_usecase.dart';

import '../../../App/app_preferences.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsUseCase productsUseCase;

  ProductsCubit({required this.productsUseCase}) : super(ProductsEmpty());

  fetch() {
    emit(ProductsProgress());

    productsUseCase.execute(ProductsUseCaseInput()).then((value) async {
      if (value.isRight()) {
        emit(ProductsSuccesed(value.asRight()));
      } else if ((value.isLeft())) {
        emit(ProductFailed((value.asLeft())));
      }
    });
  }
}
