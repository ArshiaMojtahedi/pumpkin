import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pumpkin/App/dartz_x.dart';
import 'package:pumpkin/Data/model/product.dart';
import 'package:pumpkin/Data/network/failure.dart';
import 'package:pumpkin/Domain/usecase/add_cart_item_usecase.dart';
import 'package:pumpkin/Domain/usecase/cart_list_usecase.dart';
import 'package:pumpkin/Domain/usecase/delete_cart_item_usecase.dart';
import 'package:pumpkin/Domain/usecase/get_item_count_usecase.dart';
import 'package:pumpkin/Domain/usecase/login_usecase.dart';
import 'package:pumpkin/Domain/usecase/products_usecase.dart';

import '../../../../Data/model/cartItem.dart';
import '../../../../Domain/usecase/base_usecase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  AddToCartUseCase addToCartUseCase;
  CartListUseCase cartListUseCase;
  DeleteCartItemUseCase deleteCartItemUseCase;
  GetItemCountUseCase getItemCountUseCase;

  CartCubit(
      {required this.addToCartUseCase,
      required this.cartListUseCase,
      required this.deleteCartItemUseCase,
      required this.getItemCountUseCase})
      : super(AddToCartEmpty());

  addToCart(CartItem item, {int count = 1}) {
    emit(AddToCartProgress());

    addToCartUseCase
        .execute(AddToCartUseInput(item, count))
        .then((value) async {
      value.fold(
          (l) => emit(
                AddToCartFailed((l)),
              ),
          (r) => emit(AddToCartSuccesed()));
    });
  }

  fetch() {
    emit(CartItemsEmpty());

    cartListUseCase.execute(const NoParameters()).then((value) async {
      value.fold(
          (l) => emit(
                CartItemsFailed((l)),
              ),
          (r) => emit(CartItemsSuccesed((r))));
    });
  }

  cartItemDelete(String id) {
    emit(CartItemDeleteEmpty());

    deleteCartItemUseCase.execute(DeleteCartItemInput(id)).then((value) async {
      value.fold(
          (l) => emit(
                CartItemDeleteFailed((l)),
              ),
          (r) => emit(CartItemDeleteSuccesed()));
    });
  }

  getItemCount(String id) {
    emit(CartItemCountEmpty());

    getItemCountUseCase.execute(GetItemCountInput(id)).then((value) async {
      value.fold(
          (l) => emit(
                CartItemCountFailed((l)),
              ),
          (r) => emit(CartItemCountSuccesed((r))));
    });
  }
}
