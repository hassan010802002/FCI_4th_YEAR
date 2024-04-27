part of 'log_in_controller_bloc.dart';

abstract class LogInControllerEvent extends Equatable {
  const LogInControllerEvent();
}

final class LogInAuthEvent extends LogInControllerEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
