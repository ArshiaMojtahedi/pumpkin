part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductEmpty extends ProductState {}

class ProductProgress extends ProductState {}

class ProductSuccesed extends ProductState {
  Product data;
  ProductSuccesed(this.data);
}

class ProductFailed extends ProductState {
  Failure msg;
  ProductFailed(this.msg);
}
