part of 'sign_up_controller_bloc.dart';

enum UserPrefData { successful, failed }

extension UserPrefDataX on UserPrefData {
  bool get isSuccessfulUserPrefData => this == UserPrefData.successful;

  bool get isFailureUserPrefData => this == UserPrefData.failed;
}

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

final class UserPrefDataState extends SignUpControllerState {
  final UserPrefData? userPrefDataState;
  final bool? userSignUpTokenStatus;
  final bool? userLogInTokenStatus;

  const UserPrefDataState({
    required this.userPrefDataState,
    required this.userSignUpTokenStatus,
    required this.userLogInTokenStatus,
  });

  @override
  List<Object?> get props => [userPrefDataState, userSignUpTokenStatus, userLogInTokenStatus];

  UserPrefDataState copyWith({
    UserPrefData? userPrefDataState,
    bool? userSignUpTokenStatus,
    bool? userLogInTokenStatus,
  }) {
    return UserPrefDataState(
      userPrefDataState: userPrefDataState ?? this.userPrefDataState,
      userSignUpTokenStatus: userSignUpTokenStatus ?? this.userSignUpTokenStatus,
      userLogInTokenStatus: userLogInTokenStatus ?? this.userLogInTokenStatus,
    );
  }
}
