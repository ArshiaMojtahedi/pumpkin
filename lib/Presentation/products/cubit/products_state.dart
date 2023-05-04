part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductsEmpty extends ProductsState {}

class ProductsProgress extends ProductsState {}

class ProductsSuccesed extends ProductsState {
  List<Product> data;
  ProductsSuccesed(this.data);
}

class ProductFailed extends ProductsState {
  Failure msg;
  ProductFailed(this.msg);
}
