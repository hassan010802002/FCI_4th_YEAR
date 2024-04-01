// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Components/CustomBackButton/CustomBackButton.dart';
import 'package:souqey/Components/CustomTextField/CustomTextField.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/LogInScreen/Constants/LogInConsts.dart';
import 'package:souqey/Screens/LogInScreen/Controller/log_in_controller_bloc.dart';
import 'package:souqey/Screens/LogInScreen/UI/Widgets/LogInTitleTextWidget/log_in_title_text_widget.dart';

class LogInMainView extends StatefulWidget {
  LogInControllerBloc logInControllerBloc;

  LogInMainView({super.key, required this.logInControllerBloc});

  @override
  State<LogInMainView> createState() => _LogInMainViewState();
}

class _LogInMainViewState extends State<LogInMainView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w,vertical: 10.0.h),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackButton(),
          SizedBox(
            height: 30.0.h,
          ),
          const LogInTitleTextWidget(),
          SizedBox(
            height: MediaQuery_Size_Helper.MAX_HEIGHT(context)!/15.0.h,
          ),
          CustomTextField(
            labelText: LogInConsts.emailLabelText,
            labelStyle: TextStyle(
              color: LogInConsts.emailLabelColor,
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)!/26.0.sp,
              fontFamily: TextFontFamily,
            ),
            keyboardType: TextInputType.emailAddress,
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
            textEditingController: TextEditingController(),
            fillColor: LogInConsts.color1,
          ),
          SizedBox(
            height: 10.0.h,
          ),
          CustomTextField(
            opsecure: true,
            labelText: LogInConsts.passwordLabelText,
            labelStyle: TextStyle(
              color: LogInConsts.emailLabelColor,
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)!/26.0.sp,
              fontFamily: TextFontFamily,
            ),
            keyboardType: TextInputType.emailAddress,
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
            textEditingController: TextEditingController(),
            fillColor: LogInConsts.color1,
          ),
        ],
      ),
    );
  }
}
