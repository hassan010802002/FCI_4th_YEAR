// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/Constants/ForgetPasswordConsts.dart';

class ForgetPasswordSubtitleText extends StatelessWidget {
  const ForgetPasswordSubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ForgetPasswordConsts.forgetPasswordText2,
      softWrap: true,
      style: ForgetPasswordConsts.style4(context),
      textAlign: TextAlign.start,
    );
  }
}
