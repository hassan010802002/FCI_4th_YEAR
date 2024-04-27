// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Routes/App_Pages.dart';
import 'package:souqey/Routes/App_Routes.dart';
import 'package:souqey/Screens/HomeScreen/home_screen.dart';

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
        // onGenerateRoute: (settings) {
        //
        //   return null;
        // },
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(baseIndex: 0),
      ),
    );
  }
}
