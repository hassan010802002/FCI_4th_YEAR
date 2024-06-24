// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:souqey/Screens/LogInScreen/Constants/LogInConsts.dart';

class SocialLoginTextWidget extends StatelessWidget {
  const SocialLoginTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      LogInConsts.socialAccountLoginText,
      softWrap: true,
      textAlign: TextAlign.center,
      style: LogInConsts.style7(context),
    );
  }
}
