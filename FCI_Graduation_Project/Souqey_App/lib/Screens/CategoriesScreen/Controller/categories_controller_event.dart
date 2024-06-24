part of 'categories_controller_bloc.dart';

sealed class CategoriesControllerEvent extends Equatable {
  const CategoriesControllerEvent();
}

final class CategoriesGetCategoriesEvent extends CategoriesControllerEvent {
  @override
  List<Object?> get props => [];
}

final class CategoriesGetProductsEvent extends CategoriesControllerEvent {
  @override
  List<Object?> get props => [];
}

final class CategoriesGetSubCategoriesEvent extends CategoriesControllerEvent {
  String? categoryId;

  @override
  List<Object?> get props => [categoryId];

  CategoriesGetSubCategoriesEvent({
    required this.categoryId,
  });
}

final class CategoriesGetAllProductsOnCategoryEvent extends CategoriesControllerEvent {
  String? categoryId;

  @override
  List<Object?> get props => [categoryId];

  CategoriesGetAllProductsOnCategoryEvent({
    required this.categoryId,
  });
}
