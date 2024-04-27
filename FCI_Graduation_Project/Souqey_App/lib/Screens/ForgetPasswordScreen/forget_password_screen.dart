// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/Constants/ForgetPasswordConsts.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/Controller/forget_password_controller_bloc.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/UI/Views/forget_password_main_view.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  ForgetPasswordControllerBloc? _forgetPasswordController;

  @override
  void initState() {
    _forgetPasswordController = get_Locator_it.get<ForgetPasswordControllerBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _forgetPasswordController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        primary: true,
        backgroundColor: ForgetPasswordConsts.screenBackGroundColor,
        body: BlocProvider(
          create: (context) => _forgetPasswordController!,
          child: ForgetPasswordMainView(forgetPasswordController: _forgetPasswordController!),
        ),
      ),
    );
  }
}
