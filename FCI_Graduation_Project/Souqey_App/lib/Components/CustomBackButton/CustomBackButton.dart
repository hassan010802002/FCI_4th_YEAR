import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        alignment: Alignment.centerLeft,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconSize: MaterialStatePropertyAll(20.0.sp),
        iconColor: const MaterialStatePropertyAll(Color(0xff222222)),
        fixedSize: MaterialStatePropertyAll(Size(
          MediaQuery_Size_Helper.MAX_WIDTH(context)! / 18.0.w,
          MediaQuery_Size_Helper.MAX_WIDTH(context)! / 18.0.h,
        )),
      ),
      icon: const Icon(
        FontAwesomeIcons.chevronLeft,
      ),
      splashRadius: 30.0.sp,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
