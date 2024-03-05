import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'log_in_controller_event.dart';
part 'log_in_controller_state.dart';

class LogInControllerBloc extends Bloc<LogInControllerEvent, LogInControllerState> {
  LogInControllerBloc() : super(LogInControllerInitial()) {
    on<LogInControllerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
