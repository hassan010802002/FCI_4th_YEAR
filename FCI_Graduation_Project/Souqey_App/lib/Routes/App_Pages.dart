// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:souqey/Routes/App_Routes.dart';
import 'package:souqey/Screens/LogInScreen/login_screen.dart';

class AppPages {
  static Map<String, Widget Function(BuildContext)> pages = {
    AppRoutes.loginScreen : (context) => LogInScreen(),
  };
}
