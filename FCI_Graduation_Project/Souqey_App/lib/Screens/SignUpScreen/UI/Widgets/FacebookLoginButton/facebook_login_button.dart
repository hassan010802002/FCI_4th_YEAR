// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:souqey/Screens/SignUpScreen/Constants/SignUpConsts.dart';

class FacebookLoginButton extends StatefulWidget {
  const FacebookLoginButton({super.key});

  @override
  _FacebookLoginButtonState createState() => _FacebookLoginButtonState();
}

class _FacebookLoginButtonState extends State<FacebookLoginButton> {
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
