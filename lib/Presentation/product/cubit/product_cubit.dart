import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pumpkin/App/dartz_x.dart';

import 'package:pumpkin/Domain/usecase/single_product_usecase.dart';

import '../../../App/app_preferences.dart';
import '../../../Data/model/product.dart';
import '../../../Data/network/failure.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  SingleProductUseCase productUseCase;

  ProductCubit({required this.productUseCase}) : super(ProductEmpty());

  fetch(String id) {
    emit(ProductProgress());

    productUseCase.execute(SingleProductUseCaseInput(id)).then((value) async {
      if (value.isRight()) {
        emit(ProductSuccesed(value.asRight()));
      } else if ((value.isLeft())) {
        emit(ProductFailed((value.asLeft())));
      }
    });
  }
}
