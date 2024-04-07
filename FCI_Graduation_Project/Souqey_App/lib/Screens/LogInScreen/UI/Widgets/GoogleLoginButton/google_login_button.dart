// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:souqey/Screens/LogInScreen/Constants/LogInConsts.dart';

class GoogleLoginButton extends StatefulWidget {
  const GoogleLoginButton({super.key});

  @override
  _GoogleLoginButtonState createState() => _GoogleLoginButtonState();
}

class _GoogleLoginButtonState extends State<GoogleLoginButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: LogInConsts.style2(context),
      onPressed: () {},
      icon: OctoImage(
        image: AssetImage(LogInConsts.googleIcon),
      ),
    );
  }
}
