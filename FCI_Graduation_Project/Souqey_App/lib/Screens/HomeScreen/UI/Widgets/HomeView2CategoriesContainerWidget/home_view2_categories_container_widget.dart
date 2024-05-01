// ignore_for_file: library_private_types_in_public_api

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Components/Custom_Button/Custom_Button.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/HomeScreen/Constants/HomeConsts.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';

class HomeView2CategoriesContainerWidget extends StatefulWidget {
  final HomeControllerBloc _homeController;

  const HomeView2CategoriesContainerWidget({super.key, required final HomeControllerBloc homeController}) : _homeController = homeController;

  @override
  _HomeView2CategoriesContainerWidgetState createState() => _HomeView2CategoriesContainerWidgetState();
}

class _HomeView2CategoriesContainerWidgetState extends State<HomeView2CategoriesContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 800),
      onFinish: (direction) {
        if (widget._homeController.isImageSwitching) {
          widget._homeController.switchingCurrentImage();
        }
      },
      child: Container(
        decoration: HomeConsts.containerStyle1(context, widget._homeController),
        padding: EdgeInsets.symmetric(
          horizontal: 20.0.w,
          vertical: 30.0.h,
        ),
        constraints: BoxConstraints.tight(
          Size(
            MediaQuery_Size_Helper.MAX_WIDTH(context)!.w,
            MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 1.65.h,
          ),
        ),
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              HomeConsts.fashionSaleText,
              style: HomeConsts.style9(context),
              softWrap: true,
              textAlign: TextAlign.start,
            ),
            CustomButton(
              style: HomeConsts.style10(context),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45.0.sp),
                ),
              ),
              fixedSize: MaterialStatePropertyAll(
                Size(
                  MediaQuery_Size_Helper.MAX_WIDTH(context)! / 2.0.w,
                  MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 20.0.h,
                ),
              ),
              backgroundColor: MaterialStatePropertyAll(HomeConsts.color2),
              buttonText: HomeConsts.checkButtonText,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
