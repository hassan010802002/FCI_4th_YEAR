import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souqey/Constants/Colors/AppColors.dart';
import 'package:souqey/Screens/LogInScreen/Constants/LogInConsts.dart';
import 'package:souqey/Screens/LogInScreen/Controller/log_in_controller_bloc.dart';
import 'package:souqey/Screens/LogInScreen/UI/Views/login_main_view.dart';

class LogInScreen extends StatefulWidget {
  final LogInControllerBloc loginControllerBloc = LogInControllerBloc();

  LogInScreen({ super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      backgroundColor: LogInConsts.screenBackGroundColor,
      body: BlocProvider(
        create: (context) => widget.loginControllerBloc,
        child: LogInMainView(logInControllerBloc: widget.loginControllerBloc),
      ),
    );
  }
}


