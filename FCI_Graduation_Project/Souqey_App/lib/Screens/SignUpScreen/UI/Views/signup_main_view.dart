// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Components/CustomBackButton/CustomBackButton.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Helpers/SnackBar_Helper/SnackBar_helper.dart';
import 'package:souqey/Screens/SignUpScreen/Controller/sign_up_controller_bloc.dart';
import 'package:souqey/Screens/SignUpScreen/UI/Widgets/EmailTextFieldWidget/email_text_field_widget.dart';
import 'package:souqey/Screens/SignUpScreen/UI/Widgets/FacebookLoginButton/facebook_login_button.dart';
import 'package:souqey/Screens/SignUpScreen/UI/Widgets/GoogleLoginButton/google_login_button.dart';
import 'package:souqey/Screens/SignUpScreen/UI/Widgets/LogInButtonWidget/log_in_button_widget.dart';
import 'package:souqey/Screens/SignUpScreen/UI/Widgets/NameTextFieldWidget/name_text_field_widget.dart';
import 'package:souqey/Screens/SignUpScreen/UI/Widgets/PasswordTextFieldWidget/password_text_field_widget.dart';
import 'package:souqey/Screens/SignUpScreen/UI/Widgets/SignUpAccountButtonWidget/signup_account_button_widget.dart';
import 'package:souqey/Screens/SignUpScreen/UI/Widgets/SignUpTitleTextWidget/sign_up_title_text_widget.dart';
import 'package:souqey/Screens/SignUpScreen/UI/Widgets/SocialLoginTextWidget/social_login_text_widget.dart';

class SignUpMainView extends StatefulWidget {
  final SignUpControllerBloc signUpController;

  const SignUpMainView({super.key, required this.signUpController});

  @override
  State<SignUpMainView> createState() => _SignUpMainViewState();
}

class _SignUpMainViewState extends State<SignUpMainView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.0.h),
      child: SingleChildScrollView(
        primary: true,
        child: BlocListener<SignUpControllerBloc, SignUpControllerState>(
          bloc: widget.signUpController,
          listener: (context, state) {
            if (state is SignUpAuthSuccessfulState) {
              SnackBar_Helper.showSuccessToast(context, "Successful SignUp");
            } else if (state is SignUpAuthFailureState) {
              SnackBar_Helper.showErrorToast(context, "SignUp Auth Failure");
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButton(),
                  SizedBox(
                    height: 30.0.h,
                  ),
                  const SignUpTitleTextWidget(),
                  SizedBox(
                    height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 15.0.h,
                  ),
                  NameTextFieldWidget(signUpController: widget.signUpController),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  EmailTextFieldWidget(signUpController: widget.signUpController),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  PasswordTextFieldWidget(signUpController: widget.signUpController),
                  SizedBox(
                    height: 8.0.h,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SignUpAccountButtonWidget(),
                    ],
                  ),
                  SizedBox(
                    height: 35.0.h,
                  ),
                  LogInButtonWidget(signUpController: widget.signUpController),
                ],
              ),
              SizedBox(
                height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 6.0.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SocialLoginTextWidget(),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const GoogleLoginButton(),
                      SizedBox(
                        width: 15.0.w,
                      ),
                      const FacebookLoginButton(),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
