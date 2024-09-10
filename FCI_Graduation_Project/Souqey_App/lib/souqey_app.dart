// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Routes/App_Pages.dart';
import 'package:souqey/Routes/App_Routes.dart';
import 'package:souqey/Screens/SignUpScreen/signup_screen.dart';

class SouqeyApp extends StatefulWidget {
  const SouqeyApp({super.key});

  @override
  _SouqeyAppState createState() => _SouqeyAppState();
}

class _SouqeyAppState extends State<SouqeyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery_Size_Helper.MAX_WIDTH(context)!, MediaQuery_Size_Helper.MAX_HEIGHT(context)!),
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        initialRoute: AppRoutes.initialRoute,
        routes: AppPages.pages,
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        home: const SignUpScreen(),
      ),
    );
  }
}
