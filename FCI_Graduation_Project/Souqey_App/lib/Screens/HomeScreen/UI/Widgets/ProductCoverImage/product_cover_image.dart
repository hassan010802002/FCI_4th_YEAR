import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/HomeScreen/Constants/HomeConsts.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';

class ProductCoverImage extends StatelessWidget {
  final HomeControllerBloc _homeController;
  final int _categoryViewIdx;
  final int _productViewIdx;

  const ProductCoverImage({
    super.key,
    required HomeControllerBloc homeController,
    required int categoryViewIdx,
    required int productViewIdx,
  })  : _homeController = homeController,
        _categoryViewIdx = categoryViewIdx,
        _productViewIdx = productViewIdx;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        width: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 1.8.w,
        height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 2.8.h,
      ),
      decoration: HomeConsts.containerStyle3(context, _homeController, _categoryViewIdx, _productViewIdx),
      padding: EdgeInsets.symmetric(
        vertical: 10.0.h,
        horizontal: 15.0.w,
      ),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: 10.0.w,
              vertical: 8.0.h,
            ),
            constraints: BoxConstraints.expand(
              width: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 5.5.w,
              height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 20.0.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45.0.sp),
              color: HomeConsts.color2,
            ),
            child: Text(
              HomeConsts.discountText,
              softWrap: true,
              textAlign: TextAlign.center,
              style: HomeConsts.style11(context),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 7.0.h,
                width: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 7.0.h,
                child: FloatingActionButton(
                  onPressed: () {},
                  heroTag: Random(DateTime.now().microsecond),
                  elevation: 5.0.sp,
                  isExtended: true,
                  shape: const CircleBorder(),
                  backgroundColor: HomeConsts.color1,
                  child: Icon(
                    FontAwesomeIcons.heart,
                    size: 25.0.sp,
                    color: HomeConsts.color6,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
