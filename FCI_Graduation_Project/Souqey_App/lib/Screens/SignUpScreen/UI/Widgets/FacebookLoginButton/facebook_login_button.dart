// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:souqey/Screens/SignUpScreen/Constants/SignUpConsts.dart';

class FacebookLoginButton extends StatelessWidget {
  const FacebookLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: SignUpConsts.style2(context),
      onPressed: () {},
      icon: OctoImage(
        image: AssetImage(SignUpConsts.facebookIcon),
      ),
    );
  }
}
