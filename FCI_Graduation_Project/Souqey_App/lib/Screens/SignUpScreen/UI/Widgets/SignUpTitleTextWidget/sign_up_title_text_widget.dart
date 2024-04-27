// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:souqey/Screens/SignUpScreen/Constants/SignUpConsts.dart';

class SignUpTitleTextWidget extends StatefulWidget {
  const SignUpTitleTextWidget({super.key});

  @override
  _SignUpTitleTextWidgetState createState() => _SignUpTitleTextWidgetState();
}

class _SignUpTitleTextWidgetState extends State<SignUpTitleTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      SignUpConsts.titleText,
      softWrap: true,
      style: SignUpConsts.style6(context),
      textAlign: TextAlign.start,
    );
  }
}
