part of 'home_controller_bloc.dart';

enum CategoriesStates { loading, success, failure }

extension CategoriesStatesX on CategoriesStates {
  bool get isLoading => this == CategoriesStates.loading;

  bool get isSuccess => this == CategoriesStates.success;

  bool get isError => this == CategoriesStates.failure;
}

enum AnimationStates { loading, success }

extension AnimationStatesX on AnimationStates {
  bool get isLoading => this == AnimationStates.loading;

  bool get isSuccess => this == AnimationStates.success;
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
