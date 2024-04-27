// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:souqey/Helpers/Navigator_Helper/Navigator_Helper.dart';
import 'package:souqey/Routes/App_Routes.dart';
import 'package:souqey/Screens/SignUpScreen/Constants/SignUpConsts.dart';

class SignUpAccountButtonWidget extends StatefulWidget {
  const SignUpAccountButtonWidget({super.key});

  @override
  _SignUpAccountButtonWidgetState createState() => _SignUpAccountButtonWidgetState();
}

class _SignUpAccountButtonWidgetState extends State<SignUpAccountButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        NavigatorHelper(context, AppRoutes.loginScreen);
      },
      style: SignUpConsts.style3(context),
      icon: Text(
        SignUpConsts.forgetPasswordText,
        textAlign: TextAlign.right,
        softWrap: true,
        style: SignUpConsts.style4(context),
      ),
      label: const Icon(FontAwesomeIcons.arrowRightLong),
    );
  }
}
