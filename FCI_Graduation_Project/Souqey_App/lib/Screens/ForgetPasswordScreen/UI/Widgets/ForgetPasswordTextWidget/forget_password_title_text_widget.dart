// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/Constants/ForgetPasswordConsts.dart';

class ForgetPasswordTextWidget extends StatelessWidget {
  const ForgetPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ForgetPasswordConsts.titleText,
      softWrap: true,
      style: ForgetPasswordConsts.style6(context),
      textAlign: TextAlign.start,
    );
  }
}
