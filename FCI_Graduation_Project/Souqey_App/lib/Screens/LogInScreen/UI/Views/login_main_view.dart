// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:souqey/Screens/LogInScreen/Controller/log_in_controller_bloc.dart';

class LogInMainView extends StatefulWidget {
  LogInControllerBloc logInControllerBloc;

  LogInMainView({super.key, required this.logInControllerBloc});

  @override
  State<LogInMainView> createState() => _LogInMainViewState();
}

class _LogInMainViewState extends State<LogInMainView> {
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: [

        ],
      ),
    );
  }
}
