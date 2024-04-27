// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/Screens/SignUpScreen/Constants/SignUpConsts.dart';
import 'package:souqey/Screens/SignUpScreen/Controller/sign_up_controller_bloc.dart';
import 'package:souqey/Screens/SignUpScreen/UI/Views/signup_main_view.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpControllerBloc? _signUpController;

  @override
  void initState() {
    _signUpController = get_Locator_it.get<SignUpControllerBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _signUpController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        primary: true,
        backgroundColor: SignUpConsts.screenBackGroundColor,
        body: BlocProvider(
          create: (context) => _signUpController!,
          child: SignUpMainView(signUpController: _signUpController!),
        ),
      ),
    );
  }
}
