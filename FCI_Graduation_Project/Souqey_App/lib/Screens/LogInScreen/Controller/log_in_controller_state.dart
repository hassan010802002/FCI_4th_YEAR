part of 'log_in_controller_bloc.dart';

abstract class LogInControllerState extends Equatable {
  const LogInControllerState();
}

class LogInControllerInitial extends LogInControllerState {
  @override
  List<Object> get props => [];
}

final class LogInAuthLoadingState extends LogInControllerState {
  @override
  List<Object?> get props => [];
}

final class LogInAuthSuccessfulState extends LogInControllerState {
  final UserProfileModel? _profileModel;

  const LogInAuthSuccessfulState(this._profileModel);

  @override
  List<Object?> get props => [_profileModel];
}

final class LogInAuthFailureState extends LogInControllerState {
  @override
  List<Object?> get props => [];
}
