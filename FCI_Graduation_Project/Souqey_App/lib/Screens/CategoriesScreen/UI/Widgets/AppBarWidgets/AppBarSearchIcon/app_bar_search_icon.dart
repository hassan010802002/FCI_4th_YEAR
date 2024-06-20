import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/CategoriesConsts.dart';

class AppBarSearchIcon extends StatelessWidget {
  const AppBarSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0.w),
      child: Icon(
        FontAwesomeIcons.magnifyingGlass,
        color: CategoriesConsts.color2,
        size: 25.0.sp,
      ),
    );
  }
}
