part of 'forget_password_controller_bloc.dart';

sealed class ForgetPasswordControllerEvent extends Equatable {
  const ForgetPasswordControllerEvent();
}

final class ResetForgetPasswordAuthEvent extends ForgetPasswordControllerEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
