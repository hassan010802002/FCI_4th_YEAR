// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:souqey/Screens/LogInScreen/Constants/LogInConsts.dart';

class ForgetPasswordButtonWidget extends StatelessWidget {
  const ForgetPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      style: LogInConsts.style3(context),
      icon: Text(
        LogInConsts.forgetPasswordText,
        textAlign: TextAlign.right,
        softWrap: true,
        style: LogInConsts.style4(context),
      ),
      label: const Icon(FontAwesomeIcons.arrowRightLong),
    );
  }
}
