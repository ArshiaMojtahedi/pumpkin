part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

class AddToCartEmpty extends CartState {}

class AddToCartProgress extends CartState {}

class AddToCartSuccesed extends CartState {}

class AddToCartFailed extends CartState {
  Failure msg;
  AddToCartFailed(this.msg);
}

class CartItemsEmpty extends CartState {}

class ACartItemsProgress extends CartState {}

class CartItemsSuccesed extends CartState {
  List<CartItem> data;
  CartItemsSuccesed(this.data);
}

class CartItemsFailed extends CartState {
  Failure msg;
  CartItemsFailed(this.msg);
}
