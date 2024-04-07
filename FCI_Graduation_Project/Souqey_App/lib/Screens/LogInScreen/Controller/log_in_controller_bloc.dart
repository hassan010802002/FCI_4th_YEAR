import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'log_in_controller_event.dart';
part 'log_in_controller_state.dart';

class LogInControllerBloc extends Bloc<LogInControllerEvent, LogInControllerState> {
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();

  LogInControllerBloc() : super(LogInControllerInitial()) {
    on<LogInControllerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
