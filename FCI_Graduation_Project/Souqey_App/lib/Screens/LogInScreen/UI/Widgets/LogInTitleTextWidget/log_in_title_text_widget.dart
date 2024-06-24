// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:souqey/Screens/LogInScreen/Constants/LogInConsts.dart';

class LogInTitleTextWidget extends StatelessWidget {
  const LogInTitleTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      LogInConsts.titleText,
      softWrap: true,
      style: LogInConsts.style6(context),
      textAlign: TextAlign.start,
    );
  }
}
