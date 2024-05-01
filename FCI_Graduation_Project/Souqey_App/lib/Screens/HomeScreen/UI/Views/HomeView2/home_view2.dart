// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/HomeScreen/Constants/HomeConsts.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';
import 'package:souqey/Screens/HomeScreen/UI/Widgets/HomeView2CategoriesContainerWidget/home_view2_categories_container_widget.dart';

class HomeView2 extends StatefulWidget {
  final HomeControllerBloc _homeController;

  const HomeView2({super.key, required final HomeControllerBloc homeController}) : _homeController = homeController;

  @override
  _HomeView2State createState() => _HomeView2State();
}

class _HomeView2State extends State<HomeView2> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        primary: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocBuilder<HomeControllerBloc, HomeControllerState>(
              bloc: widget._homeController,
              builder: (context, state) {
                return !widget._homeController.isImageSwitching
                    ? HomeView2CategoriesContainerWidget(
                        homeController: widget._homeController,
                      )
                    : const SizedBox();
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0.w,
                vertical: 20.0.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget._homeController.categoriesModel!.data![0].name!,
                        softWrap: true,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: HomeConsts.color3,
                          fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 12.0.sp,
                          fontWeight: FontWeight.w800,
                          fontFamily: BoldTextFontFamily,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: HomeConsts.buttonStyle1(context),
                        child: Text(
                          HomeConsts.viewAllButtonText,
                        ),
                      )
                    ],
                  ),
                  Text(
                    'You’ve never seen it before!',
                    style: HomeConsts.style1(context),
                    textAlign: TextAlign.start,
                    softWrap: true,
                  ),
                  SizedBox(
                    height: 25.0.h,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView(
                      primary: true,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: List.of([]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
