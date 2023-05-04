part of 'categories_cubit.dart';

abstract class CategoriesState extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoriesEmpty extends CategoriesState {}

class CategoriesProgress extends CategoriesState {}

class CategoriesSuccesed extends CategoriesState {
  List<CategoryModel> data;
  CategoriesSuccesed(this.data);
}

class CategoriesFailed extends CategoriesState {
  Failure msg;
  CategoriesFailed(this.msg);
}

class SingleCategoryEmpty extends CategoriesState {}

class SingleCategoryProgress extends CategoriesState {}

class SingleCategorySuccesed extends CategoriesState {
  List<Product> data;
  SingleCategorySuccesed(this.data);
}

class SingleCategoryFailed extends CategoriesState {
  Failure msg;
  SingleCategoryFailed(this.msg);
}
