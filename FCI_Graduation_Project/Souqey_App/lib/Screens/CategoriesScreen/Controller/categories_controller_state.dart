part of 'categories_controller_bloc.dart';

enum CategoriesViewsStates { first, second, third }

extension CategoriesViewsStatesX on CategoriesViewsStates {
  bool get isFirst => this == CategoriesViewsStates.first;

  bool get isSecond => this == CategoriesViewsStates.second;

  bool get isThird => this == CategoriesViewsStates.third;
}

enum SubCategoriesStates { loading, success, failure }

extension SubCategoriesStatesX on SubCategoriesStates {
  bool get isLoading => this == SubCategoriesStates.loading;
  bool get isSuccess => this == SubCategoriesStates.success;
  bool get isFailure => this == SubCategoriesStates.failure;
}

enum CategoriesStates { loading, success, failure }

extension CategoriesStatesX on CategoriesStates {
  bool get isLoading => this == CategoriesStates.loading;

  bool get isSuccess => this == CategoriesStates.success;

  bool get isError => this == CategoriesStates.failure;
}

enum ProductsStates { loading, success, failure }

extension ProductsStatesX on ProductsStates {
  bool get isLoading => this == ProductsStates.loading;

  bool get isSuccess => this == ProductsStates.success;

  bool get isError => this == ProductsStates.failure;
}

sealed class CategoriesControllerState extends Equatable {
  const CategoriesControllerState();
}

final class CategoriesControllerInitial extends CategoriesControllerState {
  @override
  List<Object> get props => [];
}

final class CategoriesGetCategoriesState extends CategoriesControllerState {
  final Categories.CategoriesModel? categoriesModel;
  final CategoriesStates? state;

  @override
  List<Object?> get props => [categoriesModel, state];

  CategoriesGetCategoriesState copyWith({
    Categories.CategoriesModel? categoriesModel,
    CategoriesStates? state,
  }) {
    return CategoriesGetCategoriesState(
      categoriesModel: categoriesModel ?? this.categoriesModel,
      state: state ?? this.state,
    );
  }

  const CategoriesGetCategoriesState({
    this.categoriesModel,
    this.state,
  });
}

final class CategoriesGetProductsState extends CategoriesControllerState {
  final Products.AllProductsModel? productsModel;
  final ProductsStates? state;

  @override
  List<Object?> get props => [productsModel, state];

  CategoriesGetProductsState copyWith({
    Products.AllProductsModel? productsModel,
    ProductsStates? state,
  }) {
    return CategoriesGetProductsState(
      productsModel: productsModel ?? this.productsModel,
      state: state ?? this.state,
    );
  }

  const CategoriesGetProductsState({
    this.productsModel,
    this.state,
  });
}

final class CategoriesChangeViewState extends CategoriesControllerState {
  final CategoriesViewsStates? state;
  @override
  List<Object?> get props => [state];

  CategoriesChangeViewState copyWith({
    CategoriesViewsStates? state,
  }) {
    return CategoriesChangeViewState(
      state: state ?? this.state,
    );
  }

  const CategoriesChangeViewState({
    this.state,
  });
}

final class CategoriesGetSubCategoriesState extends CategoriesControllerState {
  final SubCategoriesModel? subCategoriesModel;
  final SubCategoriesStates? state;
  @override
  List<Object?> get props => [subCategoriesModel, state];

  CategoriesGetSubCategoriesState copyWith({
    SubCategoriesStates? state,
    SubCategoriesModel? subCategoriesModel,
  }) {
    return CategoriesGetSubCategoriesState(state: state ?? this.state, subCategoriesModel: subCategoriesModel ?? this.subCategoriesModel);
  }

  const CategoriesGetSubCategoriesState({
    this.state,
    this.subCategoriesModel,
  });
}
