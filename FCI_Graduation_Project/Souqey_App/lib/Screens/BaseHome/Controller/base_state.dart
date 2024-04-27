part of 'base_cubit.dart';

abstract class BaseState extends Equatable {
  const BaseState();
}

class HomeBase extends BaseState {
  @override
  List<Object> get props => [];
}

class FavoritesBase extends BaseState {
  @override
  List<Object?> get props => [];
}

class ShopBase extends BaseState {
  @override
  List<Object?> get props => [];
}

class BagBase extends BaseState {
  @override
  List<Object?> get props => [];
}

class ProfileBase extends BaseState {
  @override
  List<Object?> get props => [];
}
