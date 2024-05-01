// ignore_for_file: unused_catch_clause

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/Models/CustomUserDataModule/CustomUserDataModule.dart';
import 'package:souqey/Models/UserProfileModel/UserProfileModel.dart';
import 'package:souqey/Screens/LogInScreen/Repository/LogInAuthRepo/LogInAuthRepo.dart';

part 'log_in_controller_event.dart';
part 'log_in_controller_state.dart';

@injectable
class LogInControllerBloc extends Bloc<LogInControllerEvent, LogInControllerState> {
  CustomUserDataModule? _myUserDataModel;
  LogInAuthRepo? _logInAuthRepo;
  UserProfileModel? userProfileModel;
  bool isSuccessLogInAuthStatus = false;
  TextEditingController? emailController;
  TextEditingController? passwordController;

  LogInControllerBloc() : super(LogInControllerInitial()) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _myUserDataModel = get_Locator_it.get<CustomUserDataModule>();
    _logInAuthRepo = get_Locator_it.get<LogInAuthRepo>(param1: _myUserDataModel!);

    on<LogInAuthEvent>((event, emit) async {
      isSuccessLogInAuthStatus = false;
      try {
        _myUserDataModel!.email = emailController!.text;
        _myUserDataModel!.password = passwordController!.text;
        emit(LogInAuthLoadingState());
        if (_myUserDataModel != null) {
          if (emailController!.text.isNotEmpty && passwordController!.text.isNotEmpty) {
            if (_logInAuthRepo != null) {
              userProfileModel = await _logInAuthRepo!.logIn()!;
              isSuccessLogInAuthStatus = true;
              emit(LogInAuthSuccessfulState(userProfileModel));
            } else {
              isSuccessLogInAuthStatus = false;
              emit(LogInAuthFailureState());
              throw Exception("LogIn Repo Service Failure");
            }
          } else {}
        } else {
          throw Exception("No Sufficient Data Available");
        }
      } on Exception catch (e) {
        isSuccessLogInAuthStatus = false;
        emit(LogInAuthFailureState());
      }
    });
  }

  void logInFunc() {
    add(LogInAuthEvent());
  }
}
