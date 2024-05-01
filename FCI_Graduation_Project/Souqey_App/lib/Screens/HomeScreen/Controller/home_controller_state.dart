part of 'home_controller_bloc.dart';

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

enum AnimationStates { loading, success }

extension AnimationStatesX on AnimationStates {
  bool get isLoading => this == AnimationStates.loading;

  bool get isSuccess => this == AnimationStates.success;
}

enum ViewStates { view0, view1, view2 }

extension ViewStatesX on ViewStates {
  bool get isView0 => this == ViewStates.view0;

  bool get isView1 => this == ViewStates.view1;

  bool get isView2 => this == ViewStates.view2;
}

sealed class HomeControllerState extends Equatable {
  const HomeControllerState();
}

final class HomeControllerInitial extends HomeControllerState {
  @override
  List<Object> get props => [];
}

final class HomeGetCategoriesState extends HomeControllerState {
  final CategoriesModel? categoriesModel;
  final CategoriesStates? state;

  @override
  List<Object?> get props => [categoriesModel, state];

  HomeGetCategoriesState copyWith({
    CategoriesModel? categoriesModel,
    CategoriesStates? state,
  }) {
    return HomeGetCategoriesState(
      categoriesModel: categoriesModel ?? this.categoriesModel,
      state: state ?? this.state,
    );
  }

  const HomeGetCategoriesState({
    this.categoriesModel,
    this.state,
  });
}

final class HomeGetProductsState extends HomeControllerState {
  final AllProductsModel? productsModel;
  final ProductsStates? state;

  @override
  List<Object?> get props => [productsModel, state];

  HomeGetProductsState copyWith({
    AllProductsModel? productsModel,
    ProductsStates? state,
  }) {
    return HomeGetProductsState(
      productsModel: productsModel ?? this.productsModel,
      state: state ?? this.state,
    );
  }

  const HomeGetProductsState({
    this.productsModel,
    this.state,
  });
}

final class HomeAnimationStates extends HomeControllerState {
  final int? activeIndex;
  final AnimationStates? state;

  const HomeAnimationStates({this.state, this.activeIndex});

  @override
  List<Object?> get props => [activeIndex!];

  HomeAnimationStates copyWith({
    int? activeIndex,
    AnimationStates? state,
  }) {
    return HomeAnimationStates(
      activeIndex: activeIndex ?? this.activeIndex,
      state: state ?? this.state,
    );
  }
}

final class HomeViewsStates extends HomeControllerState {
  final int? activeViewIndex;
  final ViewStates viewState;

  const HomeViewsStates({required this.activeViewIndex, required this.viewState});
  @override
  List<Object?> get props => [activeViewIndex, viewState];

  HomeViewsStates copyWith({
    int? activeViewIndex,
    ViewStates? viewState,
  }) {
    return HomeViewsStates(
      activeViewIndex: activeViewIndex ?? this.activeViewIndex,
      viewState: viewState ?? this.viewState,
    );
  }
}
