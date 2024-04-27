part of 'sign_up_controller_bloc.dart';

sealed class SignUpControllerState extends Equatable {
  const SignUpControllerState();
}

final class SignUpControllerInitial extends SignUpControllerState {
  @override
  List<Object> get props => [];
}

final class SignUpAuthLoadingState extends SignUpControllerState {
  @override
  List<Object?> get props => [];
}

final class SignUpAuthSuccessfulState extends SignUpControllerState {
  final UserProfileModel? _profileModel;

  const SignUpAuthSuccessfulState(this._profileModel);

  @override
  List<Object?> get props => [_profileModel];
}

final class SignUpAuthFailureState extends SignUpControllerState {
  @override
  List<Object?> get props => [];
}
