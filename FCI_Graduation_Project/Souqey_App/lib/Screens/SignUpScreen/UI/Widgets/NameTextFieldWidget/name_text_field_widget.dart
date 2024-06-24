// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Components/CustomTextField/CustomTextField.dart';
import 'package:souqey/Screens/SignUpScreen/Constants/SignUpConsts.dart';
import 'package:souqey/Screens/SignUpScreen/Controller/sign_up_controller_bloc.dart';

class NameTextFieldWidget extends StatelessWidget {
  final SignUpControllerBloc signUpController;

  const NameTextFieldWidget({super.key, required this.signUpController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: SignUpConsts.nameLabelText,
      labelStyle: SignUpConsts.style1(context),
      keyboardType: TextInputType.name,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(8.0.sp),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(8.0.sp),
      ),
      textEditingController: signUpController.nameController,
      fillColor: SignUpConsts.color1,
    );
  }
}
