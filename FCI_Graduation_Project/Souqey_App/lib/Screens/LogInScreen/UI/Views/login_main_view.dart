// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Components/CustomBackButton/CustomBackButton.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Helpers/SnackBar_Helper/SnackBar_helper.dart';
import 'package:souqey/Screens/LogInScreen/Controller/log_in_controller_bloc.dart';
import 'package:souqey/Screens/LogInScreen/UI/Widgets/EmailTextFieldWidget/email_text_field_widget.dart';
import 'package:souqey/Screens/LogInScreen/UI/Widgets/FacebookLoginButton/facebook_login_button.dart';
import 'package:souqey/Screens/LogInScreen/UI/Widgets/ForgetPasswordButtonWidget/forget_password_button_widget.dart';
import 'package:souqey/Screens/LogInScreen/UI/Widgets/GoogleLoginButton/google_login_button.dart';
import 'package:souqey/Screens/LogInScreen/UI/Widgets/LogInButtonWidget/log_in_button_widget.dart';
import 'package:souqey/Screens/LogInScreen/UI/Widgets/LogInTitleTextWidget/log_in_title_text_widget.dart';
import 'package:souqey/Screens/LogInScreen/UI/Widgets/PasswordTextFieldWidget/password_text_field_widget.dart';
import 'package:souqey/Screens/LogInScreen/UI/Widgets/SocialLoginTextWidget/social_login_text_widget.dart';

class LogInMainView extends StatefulWidget {
  final LogInControllerBloc logInControllerBloc;

  const LogInMainView({super.key, required this.logInControllerBloc});

  @override
  State<LogInMainView> createState() => _LogInMainViewState();
}

class _LogInMainViewState extends State<LogInMainView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.0.h),
      child: SingleChildScrollView(
        primary: true,
        child: BlocListener<LogInControllerBloc, LogInControllerState>(
          bloc: widget.logInControllerBloc,
          listener: (context, state) {
            if (state is LogInAuthSuccessfulState) {
              SnackBar_Helper.showSuccessToast(context, "Successful LogIn");
            } else if (state is LogInAuthFailureState) {
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
                  const LogInTitleTextWidget(),
                  SizedBox(
                    height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 15.0.h,
                  ),
                  EmailTextFieldWidget(logInControllerBloc: widget.logInControllerBloc),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  PasswordTextFieldWidget(logInControllerBloc: widget.logInControllerBloc),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ForgetPasswordButtonWidget(),
                    ],
                  ),
                  SizedBox(
                    height: 35.0.h,
                  ),
                  LogInButtonWidget(logInControllerBloc: widget.logInControllerBloc),
                ],
              ),
              SizedBox(
                height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 4.0.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
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
