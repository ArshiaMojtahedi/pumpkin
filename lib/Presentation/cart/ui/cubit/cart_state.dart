part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];

  get count => null;
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

class CartItemDeleteEmpty extends CartState {}

class CartItemDeleteProgress extends CartState {}

class CartItemDeleteSuccesed extends CartState {}

class CartItemDeleteFailed extends CartState {
  Failure msg;
  CartItemDeleteFailed(this.msg);
}

class CartItemCountEmpty extends CartState {}

class CartItemCountProgress extends CartState {}

class CartItemCountSuccesed extends CartState {
  int data;
  CartItemCountSuccesed(this.data);
}

class CartItemCountFailed extends CartState {
  Failure msg;
  CartItemCountFailed(this.msg);
}
