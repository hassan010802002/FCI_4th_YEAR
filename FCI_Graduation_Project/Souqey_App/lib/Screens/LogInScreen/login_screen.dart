// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souqey/Screens/LogInScreen/Constants/LogInConsts.dart';
import 'package:souqey/Screens/LogInScreen/Controller/log_in_controller_bloc.dart';
import 'package:souqey/Screens/LogInScreen/UI/Views/login_main_view.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  LogInControllerBloc? loginControllerBloc;

  @override
  void initState() {
    loginControllerBloc = LogInControllerBloc();
    super.initState();
  }

  @override
  void dispose() {
    loginControllerBloc!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        primary: true,
        backgroundColor: LogInConsts.screenBackGroundColor,
        body: BlocProvider(
          create: (context) => loginControllerBloc!,
          child: LogInMainView(logInControllerBloc: loginControllerBloc!),
        ),
      ),
    );
  }
}
