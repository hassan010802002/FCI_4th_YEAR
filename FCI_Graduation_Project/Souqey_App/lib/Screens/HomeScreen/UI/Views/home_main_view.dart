// ignore_for_file: camel_case_types, must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:souqey/Components/CustomLoadingPlaceholder/CustomLoadingPlaceholder.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/HomeScreen/Constants/HomeConsts.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';

class HomeMainView extends StatefulWidget {
  final HomeControllerBloc _homeController;

  const HomeMainView({super.key, required final HomeControllerBloc homeController}) : _homeController = homeController;

  @override
  State<HomeMainView> createState() => _HomeMainViewState();
}

class _HomeMainViewState extends State<HomeMainView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: true,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StaggeredGrid.count(
            crossAxisCount: 2,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: BlocSelector<HomeControllerBloc, HomeControllerState, bool>(
                  bloc: widget._homeController,
                  selector: (state) {
                    return widget._homeController.isSuccessCategoriesService;
                  },
                  builder: (context, state) {
                    return state
                        ? Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.zero,
                            child: BlocBuilder<HomeControllerBloc, HomeControllerState>(
                              bloc: widget._homeController,
                              builder: (context, state) {
                                return FadeInLeft(
                                  duration: const Duration(milliseconds: 800),
                                  onFinish: (direction) {
                                    widget._homeController.switchingCurrentImage();
                                  },
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                    filterQuality: FilterQuality.high,
                                    height: MediaQuery_Size_Helper.MAX_HEIGHT(context)!.h,
                                    width: MediaQuery_Size_Helper.MAX_WIDTH(context)!.w,
                                    fadeInDuration: const Duration(milliseconds: 800),
                                    imageUrl:
                                        widget._homeController.categoriesModel!.data!.elementAt(widget._homeController.activeCurrentIndex!).image!,
                                  ),
                                );
                              },
                            ),
                          )
                        : const CustomLoadingPlaceholder();
                  },
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Center(
                  child: Text(
                    'Summer Sale',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: HomeConsts.color2,
                      fontWeight: FontWeight.w800,
                      fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 11.0.sp,
                      fontFamily: BoldTextFontFamily,
                    ),
                    softWrap: true,
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child: BlocSelector<HomeControllerBloc, HomeControllerState, bool>(
                  bloc: widget._homeController,
                  selector: (state) {
                    return widget._homeController.isSuccessCategoriesService;
                  },
                  builder: (context, state) {
                    return state
                        ? Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.zero,
                            child: BlocBuilder<HomeControllerBloc, HomeControllerState>(
                              bloc: widget._homeController,
                              builder: (context, state) {
                                return FadeInLeft(
                                  duration: const Duration(milliseconds: 800),
                                  onFinish: (direction) {
                                    widget._homeController.switchingCurrentImage();
                                  },
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                    filterQuality: FilterQuality.high,
                                    height: MediaQuery_Size_Helper.MAX_HEIGHT(context)!.h,
                                    width: MediaQuery_Size_Helper.MAX_WIDTH(context)!.w,
                                    fadeInDuration: const Duration(milliseconds: 800),
                                    imageUrl:
                                        widget._homeController.categoriesModel!.data!.elementAt(widget._homeController.activeCurrentIndex!).image!,
                                  ),
                                );
                              },
                            ),
                          )
                        : const CustomLoadingPlaceholder();
                  },
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: BlocSelector<HomeControllerBloc, HomeControllerState, bool>(
                  bloc: widget._homeController,
                  selector: (state) {
                    return widget._homeController.isSuccessCategoriesService;
                  },
                  builder: (context, state) {
                    return state
                        ? Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.zero,
                            child: BlocBuilder<HomeControllerBloc, HomeControllerState>(
                              bloc: widget._homeController,
                              builder: (context, state) {
                                return FadeInLeft(
                                  duration: const Duration(milliseconds: 800),
                                  onFinish: (direction) {
                                    widget._homeController.switchingCurrentImage();
                                  },
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                    filterQuality: FilterQuality.high,
                                    height: MediaQuery_Size_Helper.MAX_HEIGHT(context)!.h,
                                    width: MediaQuery_Size_Helper.MAX_WIDTH(context)!.w,
                                    fadeInDuration: const Duration(milliseconds: 800),
                                    imageUrl:
                                        widget._homeController.categoriesModel!.data!.elementAt(widget._homeController.activeCurrentIndex!).image!,
                                  ),
                                );
                              },
                            ),
                          )
                        : const CustomLoadingPlaceholder();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
