import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';

class CustomLoadingPlaceholder extends StatelessWidget {
  const CustomLoadingPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 8.0.h),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade500,
        highlightColor: Colors.grey.shade50,
        direction: ShimmerDirection.ltr,
        period: const Duration(seconds: 3),
        loop: 5,
        child: Container(
          width: MediaQuery_Size_Helper.MAX_WIDTH(context)!,
          height: MediaQuery_Size_Helper.MAX_HEIGHT(context)!,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0.sp),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
