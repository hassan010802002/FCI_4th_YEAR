import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/Repository/ResetForgetPasswordAuthRepo/ResetForgetPasswordAuthRepo.dart';

part 'forget_password_controller_event.dart';
part 'forget_password_controller_state.dart';

@injectable
class ForgetPasswordControllerBloc extends Bloc<ForgetPasswordControllerEvent, ForgetPasswordControllerState> {
  ResetForgetPasswordAuthRepo? _resetForgetPasswordRepo;
  bool resetForgetPasswordAuthStatus = false;
  TextEditingController? emailController;

  ForgetPasswordControllerBloc() : super(ForgetPasswordControllerInitial()) {
    emailController = TextEditingController();
    _resetForgetPasswordRepo = get_Locator_it.get<ResetForgetPasswordAuthRepo>(
      param1: emailController!.text,
    );

    on<ResetForgetPasswordAuthEvent>((event, emit) async {
      resetForgetPasswordAuthStatus = false;
      try {
        emit(ResetForgetPasswordLoadingState());
        if (emailController!.text.isNotEmpty) {
          if (_resetForgetPasswordRepo != null) {
            resetForgetPasswordAuthStatus = (await _resetForgetPasswordRepo!.reset())!;
            if (resetForgetPasswordAuthStatus) {
              emit(ResetForgetPasswordSuccessfulState(resetForgetPasswordAuthStatus: resetForgetPasswordAuthStatus));
            } else {
              emit(ResetForgetPasswordFailureState());
              throw Exception("Reset Forget Password Repo Failure");
            }
          } else {}
        } else {
          throw Exception("No Sufficient Data Available");
        }
      } on Exception catch (e) {
        resetForgetPasswordAuthStatus = false;
        emit(ResetForgetPasswordFailureState());
      }
    });
  }

  void resetForgetPasswordFunc() {
    add(ResetForgetPasswordAuthEvent());
  }
}
