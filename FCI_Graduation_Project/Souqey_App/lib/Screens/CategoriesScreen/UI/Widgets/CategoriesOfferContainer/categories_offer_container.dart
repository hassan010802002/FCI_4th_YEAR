import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/CategoriesConsts.dart';

class CategoriesOfferContainer extends StatelessWidget {
  const CategoriesOfferContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 10.0.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: CategoriesConsts.color3,
        borderRadius: BorderRadius.circular(12.0.sp),
      ),
      constraints: BoxConstraints.expand(
        height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 7.0.h,
        width: MediaQuery_Size_Helper.MAX_WIDTH(context)!,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            CategoriesConsts.categoriesSummerSalesText,
            softWrap: true,
            textAlign: TextAlign.center,
            style: CategoriesConsts.textStyle1(context),
          ),
          Text(
            CategoriesConsts.categoriesSummerSalesDiscountText,
            softWrap: true,
            textAlign: TextAlign.center,
            style: CategoriesConsts.textStyle2(context),
          ),
        ],
      ),
    );
  }
}
