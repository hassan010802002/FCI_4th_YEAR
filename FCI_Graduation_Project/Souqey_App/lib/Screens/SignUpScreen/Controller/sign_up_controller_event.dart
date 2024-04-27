part of 'sign_up_controller_bloc.dart';

sealed class SignUpControllerEvent extends Equatable {
  const SignUpControllerEvent();
}

final class SignUpAuthEvent extends SignUpControllerEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
