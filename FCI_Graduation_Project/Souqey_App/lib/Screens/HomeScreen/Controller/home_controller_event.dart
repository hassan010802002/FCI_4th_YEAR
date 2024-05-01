part of 'home_controller_bloc.dart';

sealed class HomeControllerEvent extends Equatable {
  const HomeControllerEvent();
}

final class HomeGetCategoriesEvent extends HomeControllerEvent {
  @override
  List<Object?> get props => [];
}

final class HomeGetProductsEvent extends HomeControllerEvent {
  @override
  List<Object?> get props => [];
}
