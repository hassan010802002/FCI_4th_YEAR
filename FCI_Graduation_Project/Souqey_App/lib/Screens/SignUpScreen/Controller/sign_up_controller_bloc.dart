import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/Models/CustomUserDataModule/CustomUserDataModule.dart';
import 'package:souqey/Models/UserProfileModel/UserProfileModel.dart';
import 'package:souqey/Screens/SignUpScreen/Repository/SignUpAuthRepo/SignUpAuthRepo.dart';

part 'sign_up_controller_event.dart';
part 'sign_up_controller_state.dart';

@injectable
class SignUpControllerBloc extends Bloc<SignUpControllerEvent, SignUpControllerState> {
  CustomUserDataModule? _myUserDataModel;
  SignUpAuthRepo? _signUpRepo;
  UserProfileModel? userProfileModel;
  bool isSuccessSignUpAuthStatus = false;

  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? nameController;

  SignUpControllerBloc() : super(SignUpControllerInitial()) {
    _myUserDataModel = get_Locator_it.get<CustomUserDataModule>();
    _signUpRepo = get_Locator_it.get<SignUpAuthRepo>(param1: _myUserDataModel!);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();

    on<SignUpAuthEvent>((event, emit) async {
      isSuccessSignUpAuthStatus = false;
      try {
        _myUserDataModel!.name = nameController!.text;
        _myUserDataModel!.email = emailController!.text;
        _myUserDataModel!.password = passwordController!.text;
        _myUserDataModel!.rePassword = passwordController!.text;
        emit(SignUpAuthLoadingState());
        if (_myUserDataModel != null) {
          if (nameController!.text.isNotEmpty && emailController!.text.isNotEmpty && passwordController!.text.isNotEmpty) {
            if (_signUpRepo != null) {
              userProfileModel = await _signUpRepo!.signUp();
              isSuccessSignUpAuthStatus = true;
              emit(SignUpAuthSuccessfulState(userProfileModel));
            } else {
              isSuccessSignUpAuthStatus = false;
              emit(SignUpAuthFailureState());
              throw Exception("SignUp Repo Service Failure");
            }
          } else {}
        } else {
          throw Exception("No Sufficient Data Available");
        }
      } on Exception catch (e) {
        isSuccessSignUpAuthStatus = false;
        emit(SignUpAuthFailureState());
      }
    });
  }

  void signUpFunc() {
    add(SignUpAuthEvent());
  }
}
