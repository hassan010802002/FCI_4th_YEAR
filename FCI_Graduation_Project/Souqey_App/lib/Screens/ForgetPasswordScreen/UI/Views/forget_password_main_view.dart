// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Components/CustomBackButton/CustomBackButton.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Helpers/SnackBar_Helper/SnackBar_helper.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/Controller/forget_password_controller_bloc.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/UI/Widgets/EmailTextFieldWidget/email_text_field_widget.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/UI/Widgets/ForgetPasswordSubtitleText/forget_password_subtitle_text.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/UI/Widgets/ForgetPasswordTextWidget/forget_password_title_text_widget.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/UI/Widgets/ResetForgetPasswordButtonWidget/reset_forget_password_button_widget.dart';

class ForgetPasswordMainView extends StatelessWidget {
  final ForgetPasswordControllerBloc _forgetPasswordController;

  const ForgetPasswordMainView({super.key, required final ForgetPasswordControllerBloc forgetPasswordController})
      : _forgetPasswordController = forgetPasswordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.0.h),
      child: SingleChildScrollView(
        primary: true,
        child: BlocListener<ForgetPasswordControllerBloc, ForgetPasswordControllerState>(
          bloc: _forgetPasswordController,
          listener: (context, state) {
            if (state is ResetForgetPasswordSuccessfulState) {
              SnackBar_Helper.showSuccessToast(context, "!_Successful Reset Forget Password Request_!");
            } else if (state is ResetForgetPasswordFailureState) {
              SnackBar_Helper.showErrorToast(context, "!_Failed Reset Forget Password Request_!");
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBackButton(),
              SizedBox(
                height: 30.0.h,
              ),
              const ForgetPasswordTextWidget(),
              SizedBox(
                height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 10.0.h,
              ),
              const ForgetPasswordSubtitleText(),
              SizedBox(
                height: 20.0.h,
              ),
              EmailTextFieldWidget(forgetPasswordController: _forgetPasswordController),
              SizedBox(
                height: 35.0.h,
              ),
              ResetForgetPasswordButtonWidget(forgetPasswordController: _forgetPasswordController),
            ],
          ),
        ),
      ),
    );
  }
}
