part of 'forget_password_controller_bloc.dart';

sealed class ForgetPasswordControllerState extends Equatable {
  const ForgetPasswordControllerState();
}

final class ForgetPasswordControllerInitial extends ForgetPasswordControllerState {
  @override
  List<Object> get props => [];
}

final class ResetForgetPasswordSuccessfulState extends ForgetPasswordControllerState {
  final bool? _resetForgetPasswordAuthStatus;

  const ResetForgetPasswordSuccessfulState({
    required bool? resetForgetPasswordAuthStatus,
  }) : _resetForgetPasswordAuthStatus = resetForgetPasswordAuthStatus;

  @override
  List<Object> get props => [_resetForgetPasswordAuthStatus!];
}

final class ResetForgetPasswordFailureState extends ForgetPasswordControllerState {
  @override
  List<Object> get props => [];
}

final class ResetForgetPasswordLoadingState extends ForgetPasswordControllerState {
  @override
  List<Object> get props => [];
}
