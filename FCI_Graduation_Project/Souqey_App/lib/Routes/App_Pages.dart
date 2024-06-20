// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:souqey/Routes/App_Routes.dart';
import 'package:souqey/Screens/CategoriesScreen/categories_screen.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/forget_password_screen.dart';
import 'package:souqey/Screens/HomeScreen/home_screen.dart';
import 'package:souqey/Screens/LogInScreen/login_screen.dart';
import 'package:souqey/Screens/SignUpScreen/signup_screen.dart';

class AppPages {
  static Map<String, Widget Function(BuildContext)> pages = {
    AppRoutes.loginScreen: (context) => const LogInScreen(),
    AppRoutes.signupScreen: (context) => const SignUpScreen(),
    AppRoutes.forgetPasswordScreen: (context) => const ForgetPasswordScreen(),
    AppRoutes.homeScreen: (context) => const HomeScreen(baseIndex: 0),
    AppRoutes.categoriesScreen: (context) => const CategoriesScreen(baseIndex: 1),
  };
}
